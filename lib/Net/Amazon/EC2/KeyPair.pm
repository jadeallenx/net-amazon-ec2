package Net::Amazon::EC2::KeyPair;
use Moo;

=head1 NAME

Net::Amazon::EC2::KeyPair

=head1 DESCRIPTION

A class representing a key pair upon creation of a new pair.

=head1 ATTRIBUTES

=over

=item key_material (required)

The unencrypted PEM encoded RSA private key.

=back

=cut

extends 'Net::Amazon::EC2::DescribeKeyPairsResponse';

has 'key_material'   => ( is => 'ro', required => 1 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
