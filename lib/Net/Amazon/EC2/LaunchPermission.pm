package Net::Amazon::EC2::LaunchPermission;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::LaunchPermission

=head1 DESCRIPTION

A class containing information about the group or user_id associated with this launch permission attribute.

=head1 ATTRIBUTES

=over

=item group (required if user_id not defined)

A launch permission for a group. Currently only 'all' is supported, which 
gives public launch permissions. Either choose a group or a user_id but not both.

=item user_id (required if group not defined)

The AWS account id of the user with launch permissions.

=back

=cut

has 'group'         => ( is => 'ro', isa => 'Str' );
has 'user_id'       => ( is => 'ro', isa => 'Str' );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;