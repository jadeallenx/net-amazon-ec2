package Net::Amazon::EC2::NetworkInterfaceSet;

use strict;
use Moose;

=head1 NAME

Net::Amazon::EC2::NetworkInterfaceSet

=head1 DESCRIPTION

A class representing a network interface

=head1 ATTRIBUTES

=over

=item network_interface_id (required)

Network interface ID.

=item subnet_id (optional)

Subnet ID specific interface belongs to.

=item vpc_id (optional)

VPC ID specific interface belongs to.

=item description (optional)

Interface description

=item status (optional)

Current interface status.

=item mac_address (optional)

Interfaces mac address.

=item private_ip_address (optional)

Private IP address attached to the interface.

=item group_sets (optional)

An array of Net::Amazon::EC2::GroupSet objects which representing security groups attached to the interface.

=back

=cut

has 'network_interface_id' => (
   is       => 'ro',
   isa      => 'Str',
   required => 1,
);

has 'subnet_id' => (
   is       => 'ro',
   isa      => 'Str',
   required => 0,
);

has 'vpc_id' => (
   is       => 'ro',
   isa      => 'Str',
   required => 0,
);

has 'description' => (
   is       => 'ro',
   isa      => 'Maybe[Str]',
   required => 0,
);

has 'status' => (
   is       => 'ro',
   isa      => 'Str',
   required => 0,
);

has 'mac_address' => (
   is       => 'ro',
   isa      => 'Str',
   required => 0,
);

has 'private_ip_address' => (
   is       => 'ro',
   isa      => 'Str',
   required => 0,
);

has 'group_sets' => (
   is       => 'ro',
   isa      => 'Maybe[ArrayRef[Net::Amazon::EC2::GroupSet]]',
   required => 0,
);

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Igor Tsigankov <tsiganenok@gmail.com>

=head1 COPYRIGHT

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Moose;
1;
