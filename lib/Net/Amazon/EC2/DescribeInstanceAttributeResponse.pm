package Net::Amazon::EC2::DescribeInstanceAttributeResponse;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::DescribeInstanceAttributeResponse

=head1 DESCRIPTION

A class representing an instance attribute.

=head1 ATTRIBUTES

=over

=item instance_id (required)

The instance id you you are describing the attributes of.

=item block_device_mapping (optional)

Specifies how block devices are exposed to the instance. Each mapping is made up 
of a virtual_name and a device_name. This should be a Net::Amazon::EC2::BlockDeviceMapping
object.

=item disable_api_termination (optional)

Specifies whether the instance can be terminated. You must modify this attribute 
before you can terminate any "locked" instances.

=item instance_initiated_shutdown_behavior (optional)

Specifies whether the instance's Amazon EBS volumes are deleted when the instance 
is shut down. 

=item instance_type (optional)

The instance type (e.g., m1.small, c1.medium, m2.2xlarge, and so on).

=item kernel (optional)

The kernel ID.

=item ramdisk (optional)

The RAM disk ID.

=item root_device_name (optional)

The root device name (e.g., /dev/sda1).

=item user_data (optional)

MIME, Base64-encoded user data. 

=back

=cut

has 'instance_id'							=> ( is => 'ro', isa => 'Str', required => 1 );
has 'disable_api_termination'				=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'instance_initiated_shutdown_behavior'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'instance_type'							=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'kernel'								=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'ramdisk'								=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'root_device_name'						=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'user_data'								=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'block_device_mapping'					=> ( 
    is          => 'ro', 
    isa         => 'Maybe[ArrayRef[Net::Amazon::EC2::BlockDeviceMapping]]',
    required	=> 0,
);

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;