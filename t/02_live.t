use strict;
use blib;
use Test::More;

use MIME::Base64 qw(encode_base64);

BEGIN { 
    if (! $ENV{AWS_ACCESS_KEY_ID} || ! $ENV{SECRET_ACCESS_KEY} ) {
        plan skip_all => "Set AWS_ACCESS_KEY_ID and SECRET_ACCESS_KEY environment variables to run these _LIVE_ tests (NOTE: they will incur one instance hour of costs from EC2)";
    }
    else {
        plan tests => 31;
        use_ok( 'Net::Amazon::EC2' );
    }
};

#try ssl first
my $ec2 = eval {
    Net::Amazon::EC2->new(
	AWSAccessKeyId  => $ENV{AWS_ACCESS_KEY_ID},
	SecretAccessKey => $ENV{SECRET_ACCESS_KEY},
	ssl             => 1,
	debug           => 0,
	return_errors   => 1,
    );
};

$ec2 = Net::Amazon::EC2->new(
	AWSAccessKeyId  => $ENV{AWS_ACCESS_KEY_ID},
	SecretAccessKey => $ENV{SECRET_ACCESS_KEY},
	debug           => 0,
	return_errors   => 1,
) if $@;

isa_ok($ec2, 'Net::Amazon::EC2');

my $delete_key_result   = $ec2->delete_key_pair(KeyName => "test_keys");
my $delete_group_result = $ec2->delete_security_group(GroupName => "test_group");

# create_key_pair
my $key_pair = $ec2->create_key_pair(KeyName => "test_keys");
isa_ok($key_pair, 'Net::Amazon::EC2::KeyPair');
is($key_pair->key_name, "test_keys", "Does new key pair come back?");

# describe_key_pairs
my $key_pairs       = $ec2->describe_key_pairs;
my $seen_test_key   = 0;
foreach my $key_pair (@{$key_pairs}) {
    if ($key_pair->key_name eq "test_keys") {
        $seen_test_key = 1;
    }
}
ok($seen_test_key == 1, "Checking for created key pair in describe keys");

# For cleanup purposes
$ec2->delete_security_group(GroupName => "test_group");

# create_security_group
my $create_result = $ec2->create_security_group(GroupName => "test_group", GroupDescription => "test description");    
ok($create_result == 1, "Checking for created security group");

# authorize_security_group_ingress
my $authorize_result = $ec2->authorize_security_group_ingress(GroupName => "test_group", IpProtocol => 'tcp', FromPort => '7003', ToPort => '7003', CidrIp => '10.253.253.253/32');
ok($authorize_result == 1, "Checking for authorization of rule for security group");

# Add this for RT Bug: #33883
my $authorize_result_bad = $ec2->authorize_security_group_ingress(GroupName => "test_group_non_existant", IpProtocol => 'tcp', FromPort => '7003', ToPort => '7003', CidrIp => '10.253.253.253/32');
isa_ok($authorize_result_bad, 'Net::Amazon::EC2::Errors');

# describe_security_groups
my $security_groups = $ec2->describe_security_groups();
my $seen_test_group = 0;
my $seen_test_rule  = 0;
foreach my $security_group (@{$security_groups}) {
    if ($security_group->group_name eq "test_group") {
        $seen_test_group = 1;
        if ($security_group->ip_permissions->[0]->ip_ranges->[0]->cidr_ip eq '10.253.253.253/32') {
            $seen_test_rule = 1;
        }
    }
}
ok($seen_test_group == 1, "Checking for created security group in describe results");
ok($seen_test_rule == 1, "Checking for created authorized security group rule in describe results");

# revoke_security_group_ingress
my $revoke_result = $ec2->revoke_security_group_ingress(GroupName => "test_group", IpProtocol => 'tcp', FromPort => '7003', ToPort => '7003', CidrIp => '10.253.253.253/32');
ok($revoke_result == 1, "Checking for revocation of rule for security group");

my $user_data =<<_EOF;
I am the very model of a modern Major-General,
I've information vegetable, animal, and mineral,
I know the kings of England, and I quote the fights historical
From Marathon to Waterloo, in order categorical;
I'm very well acquainted, too, with matters mathematical,
I understand equations, both the simple and quadratical,
About binomial theorem I'm teeming with a lot o' news,
With many cheerful facts about the square of the hypotenuse.
I'm very good at integral and differential calculus;
I know the scientific names of beings animalculous:
In short, in matters vegetable, animal, and mineral,
I am the very model of a modern Major-General.
I know our mythic history, King Arthur's and Sir Caradoc's;
I answer hard acrostics, I've a pretty taste for paradox,
I quote in elegiacs all the crimes of Heliogabalus,
In conics I can floor peculiarities parabolous;
I can tell undoubted Raphaels from Gerard Dows and Zoffanies,
I know the croaking chorus from The Frogs of Aristophanes!
Then I can hum a fugue of which I've heard the music's din afore,
And whistle all the airs from that infernal nonsense Pinafore.
Then I can write a washing bill in Babylonic cuneiform,
And tell you ev'ry detail of Caractacus's uniform:
In short, in matters vegetable, animal, and mineral,
I am the very model of a modern Major-General.
In fact, when I know what is meant by "mamelon" and "ravelin",
When I can tell at sight a Mauser rifle from a Javelin,
When such affairs as sorties and surprises I'm more wary at,
And when I know precisely what is meant by "commissariat",
When I have learnt what progress has been made in modern gunnery,
When I know more of tactics than a novice in a nunnery—
In short, when I've a smattering of elemental strategy—
You'll say a better Major-General has never sat a gee.
For my military knowledge, though I'm plucky and adventury,
Has only been brought down to the beginning of the century;
But still, in matters vegetable, animal, and mineral,
I am the very model of a modern Major-General.
_EOF

# run_instances
my $run_result = $ec2->run_instances(
        MinCount        => 1, 
        MaxCount        => 1, 
        ImageId         => "ami-26b6534f", # ec2-public-images/developer-image.manifest.xml
        KeyName         => "test_keys", 
        SecurityGroup   => "test_group",
        InstanceType    => 'm1.small',
        UserData        => encode_base64($user_data, ""),
        EbsOptimized    => 0,
);
isa_ok($run_result, 'Net::Amazon::EC2::ReservationInfo');
ok($run_result->group_set->[0]->group_name eq "test_group", "Checking for running instance");
my $instance_id = $run_result->instances_set->[0]->instance_id;

# describe_instances
my $running_instances = $ec2->describe_instances();
my $seen_test_instance = 0;
foreach my $instance (@{$running_instances}) {
    my $instance_set = $instance->instances_set->[0];
    my $key_name = $instance_set->key_name || '';
    my $image_id = $instance_set->image_id || '';
    if ($key_name eq 'test_keys' and $image_id eq 'ami-26b6534f') {
        $seen_test_instance = 1;
    }
}
ok($seen_test_instance == 1, "Checking for newly run instance");

my $volume = $ec2->create_volume(
    Size             => 10,
    AvailabilityZone => 'us-east-1a',
    VolumeType       => 'io1',
    Iops             => 300,
    Encrypted        => 1
);
note explain $volume;

isa_ok($volume, 'Net::Amazon::EC2::Volume');

my $rc = $ec2->delete_volume( VolumeId => $volume->volume_id );
note explain $rc;
ok($rc, "successfully deleted volume");


# create tags
my $create_tags_result = $ec2->create_tags(
    ResourceId  => $instance_id,
    Tags        => { 
                Name => 'hoge',
        test_tag_key => 'test_tag_value',
    },
);
ok($create_tags_result == 1, "Checking for created tags");

# describe_instances
$running_instances = $ec2->describe_instances();
my $test_instance;
foreach my $instance (@{$running_instances}) {
    my $instance_set = $instance->instances_set->[0];
    if ($instance_set->instance_id eq $instance_id) {
        $test_instance = $instance_set;
        last;
    }
}
# instance name
is($test_instance->name, 'hoge', 'Checking for instance name');
# instance tags
foreach my $tag (@{$test_instance->tag_set}) {
    if($tag->key eq 'Name' && $tag->value eq 'hoge') {
        ok(1, 'Checking for tag (Name=hoge)');
    }elsif($tag->key eq 'test_tag_key' && $tag->value eq 'test_tag_value') {
        ok(1, 'Checking for tag (test_tag_key=test_tag_value)');
    }
}
# delete tags
my $delete_tags_result = $ec2->delete_tags(
    ResourceId  => $instance_id,
    'Tag.Key'   => ["Name","test_tag_key"],
);
ok($delete_tags_result == 1, "Checking for delete tags");

note("Describe instance status test takes up to 600 seconds to complete. Be patient.");
my $instance_statuses;
my $loop_count = 0;
while ( $loop_count < 120 ) {
    $instance_statuses = $ec2->describe_instance_status(); 
    if ( not defined $instance_statuses->[0] ) {
        sleep 5;
        $loop_count++;
        next;
    }
    else {
        last;
    }
}
isa_ok($instance_statuses->[0], 'Net::Amazon::EC2::InstanceStatuses');

# terminate_instances
my $terminate_result = $ec2->terminate_instances(InstanceId => $instance_id);
is($terminate_result->[0]->instance_id, $instance_id, "Checking to see if instance was terminated successfully");

# delete_key_pair
$delete_key_result = $ec2->delete_key_pair(KeyName => "test_keys");
ok($delete_key_result == 1, "Deleting key pair");

my $availability_zones = $ec2->describe_availability_zones();
my $seen_availability_zone = 0;
foreach my $availability_zone (@{$availability_zones}) {
	if ($availability_zone->zone_name eq 'us-east-1a') {
		$seen_availability_zone = 1;
	}
}
ok($seen_availability_zone == 1, "Describing availability zones");

my $regions = $ec2->describe_regions();
my $seen_region = 0;
foreach my $region (@{$regions}) {
	if ($region->region_name eq 'us-east-1') {
		$seen_region = 1;
	}
}
ok($seen_region == 1, "Describing regions");

my $reserved_instance_offerings = $ec2->describe_reserved_instances_offerings();
my $seen_offering = 0;
foreach my $offering (@{$reserved_instance_offerings}) {
	if ($offering->product_description eq 'Linux/UNIX') {
		$seen_offering = 1;
	}
}
ok($seen_offering == 1, "Describing Reserved Instances Offerings");

note("Delete security group test takes up to 600 seconds to complete. Be patient.");
# delete_security_group
$loop_count = 0;
while ( $loop_count < 120 ) {
    $delete_group_result = $ec2->delete_security_group(GroupName => "test_group");
    if ( ref($delete_group_result) =~ /Error/ ) {
        # If we get an error, loop until we don't
        sleep 5;
        $loop_count++;
        next;
    }
    else {
        last;
    }
}
ok($delete_group_result == 1, "Deleting security group");

# create_volume
my $volume = $ec2->create_volume(
        Size             => 1,
        AvailabilityZone => 'us-east-1a',
        Encrypted        => 'true',
);
isa_ok($volume, 'Net::Amazon::EC2::Volume');

my $describe_volume = $ec2->describe_volumes( { VolumeId => $volume->volume_id } );
ok($describe_volume->[0]->volume_id, $volume->volume_id);

my $delete_volume = $ec2->delete_volume( { VolumeId => $volume->volume_id } );
ok($delete_volume == 1, "Deleting volume");

# THE REST OF THE METHODS ARE SKIPPED FOR NOW SINCE IT WOULD REQUIRE A DECENT AMOUNT OF TIME IN BETWEEN OPERATIONS TO COMPLETE
