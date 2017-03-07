package Net::Amazon::EC2::ReservationInfo;
use Moo;

=head1 NAME

Net::Amazon::EC2::ReservationInfo

=head1 DESCRIPTION

A class representing a run instance reservation.

=head1 ATTRIBUTES

=over

=item reservation_id (required)

Unique ID attached to the reservation.

=item owner_id (required)

AWS Account id of the person making the reservation.

=item group_set

An array ref of Net::Amazon::EC2::GroupSet objects.

=item instances_set (required)

An array ref of Net::Amazon::EC2::RunningInstances objects.

=item requesterId (optional)

ID of the requester.

=cut

has 'reservation_id'	=> ( is => 'ro', required => 1 );
has 'owner_id'			=> ( is => 'ro', required => 1 );
has 'group_set'			=> ( 
    is			=> 'ro', 
    required	=> 1
);
has 'instances_set'		=> ( 
    is			=> 'ro',
    required	=> 1
);
has 'requester_id'		=> ( is => 'ro', required => 0 );

=back

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
