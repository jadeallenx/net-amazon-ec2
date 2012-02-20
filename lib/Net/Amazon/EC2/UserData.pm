package Net::Amazon::EC2::UserData;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::UserData

=head1 DESCRIPTION

A class representing EC2 User Data attached to an instance.

=head1 ATTRIBUTES

=over

=item data (required)

User data itself which is passed to the instance.

=cut

has 'data'	=> ( is => 'ro', isa => 'Str', required => 1 );

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