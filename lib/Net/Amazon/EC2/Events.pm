package Net::Amazon::EC2::Events;

use Moose;

=head1 NAME

Net::Amazon::EC2::Events

=head1 DESCRIPTION

A class representing a EC2 Events block

=head1 ATTRIBUTES

=over

=item code (required)

The code of the event.

=item description (required)

The description of the event.

=item not_before (required)

The date the event will not occur before.

=item not_after (optional)

The date the event will not occur after.

=back

=cut

has 'code'        => ( is => 'ro', isa => 'Str', required => 1 );
has 'description' => ( is => 'ro', isa => 'Str', required => 1 );
has 'not_before'  => ( is => 'ro', isa => 'Str', required => 1 );
has 'not_after'   => ( is => 'ro', isa => 'Str', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Matt West <https://github.com/mhwest13>

=head1 COPYRIGHT

Copyright (c) 2014 Matt West. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Moose;
1;
