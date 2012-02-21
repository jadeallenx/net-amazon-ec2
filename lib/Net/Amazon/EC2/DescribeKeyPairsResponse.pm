package Net::Amazon::EC2::DescribeKeyPairsResponse;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::DescribeKeyPairsResponse

=head1 DESCRIPTION

A class representing a key pair.

=head1 ATTRIBUTES

=over

=item key_name (required)

The name of the key pair.

=item key_fingerprint (required)

A fingerprint for the private key of the key pair. This is calculated as the SHA-1 of the DER version of the private key.

=cut

has 'key_name'          => ( is => 'ro', isa => 'Str', required => 1 );
has 'key_fingerprint'   => ( is => 'ro', isa => 'Str', required => 1 );

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