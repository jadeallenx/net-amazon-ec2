package Net::Amazon::EC2::GroupSet;
use Moo;
use MooX::Types::MooseLike::Base;

=head1 NAME

Net::Amazon::EC2::GroupSet

=head1 DESCRIPTION

A class containing information about a group.

=head1 ATTRIBUTES

=over

=item group_id (required)

The ID of the group.

=cut

has 'group_id'  => ( is => 'ro', isa => Str, required => 1 );
has 'group_name' => ( is => 'ro', isa => Maybe[Str], required => 1 );

=back

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
