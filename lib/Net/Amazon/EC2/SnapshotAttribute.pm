package Net::Amazon::EC2::SnapshotAttribute;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::SnapshotAttribute

=head1 DESCRIPTION

A class representing the snapshot attributes of a volume.

=head1 ATTRIBUTES

=over

=item snapshot_id (required)

The ID of the snapshot.

=item permissions (required)

An arrayref of Net::Amazon::EC2::CreateVolumePermission objects

=back

=cut

has 'snapshot_id'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'permissions'	=> ( is => 'ro', isa => 'Maybe[ArrayRef[Net::Amazon::EC2::CreateVolumePermission]]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;