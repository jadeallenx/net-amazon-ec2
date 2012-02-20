package Net::Amazon::EC2::AvailabilityZoneMessage;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::AvailabilityZoneMessage

=head1 DESCRIPTION

A class containing messaging associated with an availability zone.

=head1 ATTRIBUTES

=over

=item message (required)

The message itself.

=cut

has 'message'  => ( is => 'ro', isa => 'Str', required => 1 );

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