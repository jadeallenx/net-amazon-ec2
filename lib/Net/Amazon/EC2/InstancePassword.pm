package Net::Amazon::EC2::InstancePassword;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::InstancePassword

=head1 DESCRIPTION

A class representing a instance password for a Windows-based instance.

=head1 ATTRIBUTES

=over

=item instance_id (required)

The ID of the instance.

=item timestamp (required)

The time the data was last updated.

=item password_data (required)

The password of the instance.

=back

=cut

has 'instance_id'   => ( is => 'ro', isa => 'Str', required => 1 );
has 'timestamp'		=> ( is => 'ro', isa => 'Str', required => 1 );
has 'password_data'	=> ( is => 'ro', isa => 'Str', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;