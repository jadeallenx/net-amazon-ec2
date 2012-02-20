package Net::Amazon::EC2::LaunchPermissionOperation;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::LaunchPermissionOperation

=head1 DESCRIPTION

A class representing the operation type of the launch permission (adding or removing).

=head1 ATTRIBUTES

=over

=item add (required if remove not defined)

An Net::Amazon::EC2::LaunchPermission object to add permissions for.

=item remove (required if add not defined)

An Net::Amazon::EC2::LaunchPermission object to remove permissions for.

=back

=cut

has 'add'			=> ( is => 'ro', isa => 'Net::Amazon::EC2::LaunchPermission', required => 0 );
has 'remove'		=> ( is => 'ro', isa => 'Net::Amazon::EC2::LaunchPermission', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;