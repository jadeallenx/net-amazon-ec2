package Net::Amazon::EC2::CreateVolumePermission;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::CreateVolumePermission

=head1 DESCRIPTION

A class representing the users or groups allowed to create a volume from the associated snapshot.

=head1 ATTRIBUTES

=over

=item user_id (optional)

User ID of a user that can create volumes from the snapshot.

=item group (optional)

Group that is allowed to create volumes from the snapshot (currently supports "all").

=cut

has 'user_id'       => ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'group'			=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );

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