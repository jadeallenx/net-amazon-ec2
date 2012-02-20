package Net::Amazon::EC2::RunningInstances;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::RunningInstances

=head1 DESCRIPTION

A class representing a running instance.

=head1 ATTRIBUTES

=over

=item ami_launch_index (optional)

The AMI launch index, which can be used to find 
this instance within the launch group.

=item dns_name (optional)

The public DNS name assigned to the instance. This DNS 
name is contactable from outside the Amazon EC2 network. 
This element remains empty until the instance enters a 
running state.

=item image_id (required)

The image id of the AMI currently running in this instance.

=item kernel_id (required)

The kernel id of the AKI currently running in this instance.

=item ramdisk_id (required)

The ramdisk id of the ARI loaded in this instance.

=item instance_id (required)

The instance id of the launched instance.

=item instance_state (required)

An Net::Amazon::EC2::InstanceState object.

=item instance_type (required)

The type of instance launched.

=item key_name (optional)

The key pair name the instance was launched with.

=item launch_time (required)

The time the instance was started.

=item placement (required)

A Net::Amazon::EC2::PlacementResponse object.

=item private_dns_name (optional)

The private DNS name assigned to the instance. This DNS 
name can only be used inside the Amazon EC2 network. 
This element remains empty until the instance enters a 
running state.

=item product_codes (optional)

An array ref of Net::Amazon::EC2::ProductCode objects.

=item reason (optional)

The reason for the most recent state transition.

=item platform (optional)

The operating system for this instance.

=item monitoring (optional)

The state of monitoring on this instance.

=item subnet_id (optional)

Specifies the subnet ID in which the instance is running (Amazon Virtual Private Cloud).

=item vpc_id (optional)

Specifies the VPC in which the instance is running (Amazon Virtual Private Cloud).

=item private_ip_address (optional)

Specifies the private IP address that is assigned to the instance (Amazon VPC).

=item ip_address (optional)

Specifies the IP address of the instance.

=item state_reason (optional)

The reason for the state change.

A Net::Amazon::EC2::StateReason object.

=item architecture (optional)

The architecture of the image.

=item root_device_name (optional)

The root device name (e.g., /dev/sda1).

=item root_device_type (optional)

The root device type used by the AMI. The AMI can use an Amazon EBS or instance store root device.

=item block_device_mapping (optional)

An array ref of Net::Amazon::EC2::BlockDeviceMapping objects.

=item tag_set (optional)

An array ref of Net::Amazon::EC2::TagSet objects.

=item name (optional)

The instance name from tags.

=cut

has 'ami_launch_index'  	=> ( is => 'ro', isa => 'Str', required => 0 );
has 'dns_name'          	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'image_id'          	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'kernel_id'         	=> ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'ramdisk_id'        	=> ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'instance_id'       	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'instance_state'    	=> ( 
    is => 'ro', 
    isa => 'Net::Amazon::EC2::InstanceState', 
    required => 1
);
has 'instance_type'     	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'key_name'          	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'launch_time'       	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'placement'				=> ( is => 'ro', isa => 'Net::Amazon::EC2::PlacementResponse', required => 1 );
has 'private_dns_name'  	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'product_codes'     	=> ( 
    is          => 'rw', 
    isa         => 'ArrayRef[Net::Amazon::EC2::ProductCode]',
    auto_deref  => 1,
    required	=> 0,
);
has 'reason'            	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'platform'				=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'monitoring'			=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'subnet_id'				=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'vpc_id'				=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'private_ip_address'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'ip_address'			=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'state_reason'			=> ( is => 'ro', isa => 'Maybe[Net::Amazon::EC2::StateReason]', required => 0 );
has 'architecture'			=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'root_device_name'		=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'root_device_type'		=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'block_device_mapping'	=> ( is => 'ro', isa => 'Maybe[ArrayRef[Net::Amazon::EC2::BlockDeviceMapping]]', required => 0 );
has 'tag_set'				=> ( is => 'ro', isa => 'Maybe[ArrayRef[Net::Amazon::EC2::TagSet]]', required => 0 );
has 'name' => (
	is => 'ro',
	lazy    => 1,
	default => sub {
		my $self = shift;
		return '' if !$self->tag_set || scalar @{$self->tag_set} == 0;
		my $name = (grep {$_->{key} eq 'Name'} @{$self->tag_set})[0];
		return $name->{value} || '';
	},
);


__PACKAGE__->meta->make_immutable();

=back

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;
