package Net::Amazon::EC2::TagSet;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::TagSet

=head1 DESCRIPTION

A class containing information about a tag.

=head1 ATTRIBUTES

=over

=item key (required)

The key of the tag.

=item value (required)

The value of the tag.

=cut

has 'key'   => ( is => 'ro', isa => 'Str', required => 1 );
has 'value' => ( is => 'ro', isa => 'Str', required => 1 );

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

