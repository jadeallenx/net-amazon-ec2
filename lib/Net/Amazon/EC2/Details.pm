package Net::Amazon::EC2::Details;

use Moose;

=head1 NAME

Net::Amazon::EC2::Details

=head1 DESCRIPTION

A class representing a EC2 details block

=head1 ATTRIBUTES

=over

=item name (required)

The name of the detail.

=item status (required)

The status of the detail.

=back

=cut

has 'name'   => ( is => 'ro', isa => 'Str', required => 1 );
has 'status' => ( is => 'ro', isa => 'Str', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Matt West <https://github.com/mhwest13>

=head1 COPYRIGHT

Copyright (c) 2014 Matt West. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Moose;
1;
