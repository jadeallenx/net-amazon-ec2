package Net::Amazon::EC2::DescribeSubnetResponse;

use Moose;

=head1 NAME

Net::Amazon::EC2::DescribeSubnetResponse

=head1 DESCRIPTION

A class containing information about subnets

=head1 ATTRIBUTES

=over

=item subnet_id (required)

The ID of the subnet.

=item state (required)

The current state of the subnet.

Values:

pending | available

=item vpc_id (required)

The ID of the VPC the subnet is in.

=item cidr_block

The CIDR block assigned to the subnet.

=available_ip_address_count

The number of unused IP addresses in the subnet. Note that the IP addresses for any stopped instances are considered unavailable.

=availability_zone

The Availability Zone of the subnet.

=default_for_az

Indicates whether this is the default subnet for the Availability Zone.

=map_public_ip_on_launch

Indicates whether instances launched in this subnet receive a public IP address.

=tag_set
Any tags assigned to the resource, each one wrapped in an item element.

=back

=cut

has 'subnet_id'                   => ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'state'                       => ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'vpc_id'		                  => ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'cidr_block'		              => ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'available_ip_address_count'  => ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'availability_zone'           => ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'default_for_az'              => ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'map_public_ip_on_launch'     => ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'tag_set'                     => ( is => 'ro', isa => 'Maybe[ArrayRef[Net::Amazon::EC2::TagSet]]', required => 0 );
__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jonas Courteau <jonas.courteau@hootsuite.com>

=head1 COPYRIGHT

Copyright (c) 2014 Jonas Courteau. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Moose;
1;

