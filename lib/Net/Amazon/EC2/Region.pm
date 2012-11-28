package Net::Amazon::EC2::Region;
use Moo;

=head1 NAME

Net::Amazon::EC2::Region

=head1 DESCRIPTION

A class representing a EC2 region

=head1 ATTRIBUTES

=over

=item region_name (required)

The name of the region.

=item region_endpoint (required)

The region service endpoint.

=back

=cut

has 'region_name'		=> ( is => 'ro', required => 1 );
has 'region_endpoint'	=> ( is => 'ro', required => 1 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
