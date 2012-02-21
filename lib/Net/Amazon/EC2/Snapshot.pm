package Net::Amazon::EC2::Snapshot;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::Snapshot

=head1 DESCRIPTION

A class representing a snapshot of a volume.

=head1 ATTRIBUTES

=over

=item snapshot_id (required)

The ID of the snapshot.

=item status (required)

The snapshot's status.

=item volume_id (required)

The ID of the volume the snapshot was taken from.

=item start_time (required)

The time the snapshot was started.

=item progress (required)

The current progress of the snapshop, in percent.

=item owner_id (required)

AWS Access Key ID of the user who owns the snapshot.

=item volume_size (required)

The size of the volume, in GiB.

=item description (optional)

Description of the snapshot.

=item owner_alias (optional)

The AWS account alias (e.g., "amazon", "redhat", "self", etc.) or AWS account ID that owns the AMI.

=back

=cut

has 'snapshot_id'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'status'		=> ( is => 'ro', isa => 'Str', required => 1 );
has 'volume_id'		=> ( is => 'ro', isa => 'Str', required => 1 );
has 'start_time'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'progress'		=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'owner_id'		=> ( is => 'ro', isa => 'Str', required => 1 );
has 'volume_size'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'description'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'owner_alias'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;