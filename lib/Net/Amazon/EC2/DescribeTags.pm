package Net::Amazon::EC2::DescribeTags;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::DescribeTags

=head1 DESCRIPTION

A class containing information about tags

=head1 ATTRIBUTES

=over

=item resource_id (required)

The resource_id of the tag.

=item resource_type (required)

The resource_type of the tag.

Values:

customer-gateway | dhcp-options | image | instance | internet-gateway | network-acl | reserved-instances | route-table | security-group | snapshot | spot-instances-request | subnet | volume | vpc | vpn-connection | vpn-gateway

=item key (required)

The key of the tag.

=item value (required)

The value of the tag.

=back

=cut

has 'resource_id'		=> ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'resource_type'		=> ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'key'				=> ( is => 'ro', isa => 'Maybe[Str]', required => 1 );
has 'value'				=> ( is => 'ro', isa => 'Maybe[Str]', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;

