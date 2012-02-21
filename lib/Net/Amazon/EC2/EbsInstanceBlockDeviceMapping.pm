package Net::Amazon::EC2::EbsInstanceBlockDeviceMapping;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::EbsInstanceBlockDeviceMapping

=head1 DESCRIPTION

A class representing a EBS block device mapping

=head1 ATTRIBUTES

=over

=item attach_time (required)

Time stamp when the attachment initiated.

=item delete_on_termination (required)

Specifies whether the Amazon EBS volume is deleted on instance termination.

=item status (required)

Attachment state.

=item volume_id (required)

The EBS volume id.

=back

=cut

has 'attach_time'			=> ( is => 'ro', isa => 'Str', required => 1 );
has 'delete_on_termination'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'status'				=> ( is => 'ro', isa => 'Str', required => 1 );
has 'volume_id'				=> ( is => 'ro', isa => 'Str', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;