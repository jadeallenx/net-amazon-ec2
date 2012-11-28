package Net::Amazon::EC2::TagSet;
use Moo;

=head1 NAME

Net::Amazon::EC2::TagSet

=head1 DESCRIPTION

A class containing information about a tag.

=head1 ATTRIBUTES

=over

=item key (required)

The key of the tag.

=item value 

The value of the tag. (May be undefined if there is no value for a given key.)

=cut

has 'key'   => ( is => 'ro', required => 1 );
has 'value' => ( is => 'ro', required => 1 );

=back

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
