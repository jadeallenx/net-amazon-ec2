package Net::Amazon::EC2::AvailabilityZone;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::AvailabilityZone

=head1 DESCRIPTION

A class representing an availability zone

=head1 ATTRIBUTES

=over

=item zone_name (required)

Name of the Availability Zone.

=item zone_state (required)

State of the Availability Zone. 

=item region_name (required)

Name of the region.

=item messages (optional)

An array ref of Net::Amazon::EC2::AvailabilityZoneMessage objects representing messages for this zone (if any)

=back

=cut

has 'zone_name'		=> ( is => 'ro', isa => 'Str', required => 1 );
has 'zone_state'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'region_name'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'messages'		=> ( is => 'ro', isa => 'Maybe[Net::Amazon::EC2::AvailabilityZone]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;