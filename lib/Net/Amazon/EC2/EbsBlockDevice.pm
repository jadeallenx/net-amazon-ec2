package Net::Amazon::EC2::EbsBlockDevice;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::Net::Amazon::EC2::EbsBlockDevice

=head1 DESCRIPTION

A class representing a EBS block device

=head1 ATTRIBUTES

=over

=item snapshot_id (optional)

The EBS snapshot id.

=item volume_size (optional)

The size, in GiB (1GiB = 2^30 octects)

=item delete_on_termination (optional)

Specifies whether the Amazon EBS volume is deleted on instance termination.

=back

=cut

has 'snapshot_id'			=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'volume_size'			=> ( is => 'ro', isa => 'Maybe[Int]', required => 0 );
has 'delete_on_termination'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;