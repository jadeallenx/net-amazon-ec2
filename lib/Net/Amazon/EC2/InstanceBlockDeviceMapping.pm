package Net::Amazon::EC2::InstanceBlockDeviceMapping;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::InstanceBlockDeviceMapping

=head1 DESCRIPTION

A class representing a instance block device mapping

=head1 ATTRIBUTES

=over

=item volume_id (required)

The volume id of the EBS Volume.

=item status (required)

The status of the attachment.

=item attach_time (required)

The time of attachment.

=item delete_on_termination (required)

A boolean indicating if the volume will be deleted on instance termination.

=back

=cut

has 'volume_id'				=> ( is => 'ro', isa => 'Str', required => 1 );
has 'status'				=> ( is => 'ro', isa => 'Str', required => 1 );
has 'attach_time'			=> ( is => 'ro', isa => 'Str', required => 1 );
has 'delete_on_termination'	=> ( is => 'ro', isa => 'Str', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;