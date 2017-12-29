package Net::Amazon::EC2::SystemStatus;

use Moose;

=head1 NAME

Net::Amazon::EC2::SystemStatus

=head1 DESCRIPTION

A class representing a EC2 SystemStatus block

=head1 ATTRIBUTES

=over

=item details (required)

The details for the system status.

=item status (required)

The system status results.

=back

=cut

has 'status' => ( is => 'ro', isa => 'Str', required => 1 );
has 'details' =>
  ( is => 'ro', isa => 'ArrayRef[Net::Amazon::EC2::Details]', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Matt West <https://github.com/mhwest13>

=head1 COPYRIGHT

Copyright (c) 2014 Matt West. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Moose;
1;
