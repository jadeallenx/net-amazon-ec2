package Net::Amazon::EC2::PlacementResponse;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::PlacementResponse

=head1 DESCRIPTION

A class containing information about the placement of an instance in an availability zone.

=head1 ATTRIBUTES

=over

=item availability_zone (required)

The availability zone for the instance.

=back

=cut

has 'availability_zone'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;