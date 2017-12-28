package Net::Amazon::EC2::InstanceStatuses;

use Moose;

=head1 NAME

Net::Amazon::EC2::InstanceStatuses

=head1 DESCRIPTION

A class representing a EC2 InstanceStatuses block

=head1 ATTRIBUTES

=over

=item instance_status (required)

The instance status results.

=item availability_zone (required)

The availability_zone results.

=item instance_id (required)

The instance_id results.

=item instance_state (required)

The instance_state results.

=item system_status (required)

The system_status results.

=item events (required)

The events results

=back

=cut

has 'availability_zone' => ( is => 'ro', isa => 'Str', required => 1 );
has 'events' =>
  ( is => 'ro', isa => 'ArrayRef[Net::Amazon::EC2::Events]', required => 1 );
has 'instance_id' => ( is => 'ro', isa => 'Str', required => 1 );
has 'instance_status' =>
  ( is => 'ro', isa => 'Net::Amazon::EC2::InstanceStatus', required => 1 );
has 'instance_state' =>
  ( is => 'ro', isa => 'Net::Amazon::EC2::InstanceState', required => 1 );
has 'system_status' =>
  ( is => 'ro', isa => 'Net::Amazon::EC2::SystemStatus', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Matt West <https://github.com/mhwest13>

=head1 COPYRIGHT

Copyright (c) 2014 Matt West. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Moose;
1;
