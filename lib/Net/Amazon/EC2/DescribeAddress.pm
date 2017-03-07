package Net::Amazon::EC2::DescribeAddress;
use Moo;

=head1 NAME

Net::Amazon::EC2::DescribeAddress

=head1 DESCRIPTION

A class containing information about allocated elastic addresses and the instances they are bound to

=head1 ATTRIBUTES

=over

=item public_ip (required)

The public ip address allocated.

=item instance_id (optional)

The instance id (if any) associated with the public ip. 

=back

=cut

has 'public_ip'		=> ( is => 'ro', required => 1 );
has 'instance_id'	=> ( is => 'ro', required => 0 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
