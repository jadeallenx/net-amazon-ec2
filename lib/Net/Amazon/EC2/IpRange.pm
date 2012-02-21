package Net::Amazon::EC2::IpRange;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::IpRange

=head1 DESCRIPTION

A class representing an IP range (CIDR).

=head1 ATTRIBUTES

=over

=item cidr_ip (required)

CIDR IP Range.

=back

=cut

has 'cidr_ip'  => ( is => 'ro', isa => 'Str' );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;