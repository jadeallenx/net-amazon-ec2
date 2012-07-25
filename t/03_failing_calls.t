use strict;
use blib;
use Test::More;
use Test::Exception;

BEGIN { 
    plan tests => 5;
    use_ok( 'Net::Amazon::EC2' );
};

# Since you don't have an Amazon EC2 api endpoint running locally
# (you don't, right?) all api calls should fail, and thus allow us to
# test it properly.

my $access_id  = 'xxx';
my $secret_key = 'yyy';
my $base_url   = 'http://localhost';

my $die_ec2 = Net::Amazon::EC2->new(
	AWSAccessKeyId  => $access_id,
	SecretAccessKey => $secret_key,
    base_url        => $base_url,
);

my $old_ec2 = Net::Amazon::EC2->new(
    AWSAccessKeyId  => $access_id,
    SecretAccessKey => $secret_key,
    base_url        => $base_url,
    return_errors   => 1,
);

my $errors;
lives_ok { $errors = $old_ec2->describe_instances } "return_errors on , api call lives";
dies_ok  { $die_ec2->describe_instances } "return_errors off, api call dies";

is_deeply ($@, $errors, "Same error thrown and returned");

my $dbg_ec2 = Net::Amazon::EC2->new(
    AWSAccessKeyId  => $access_id,
    SecretAccessKey => $secret_key,
    base_url        => $base_url,
    debug           => 1,
);

dies_ok { $dbg_ec2->describe_instances } "with debug on also dies";

