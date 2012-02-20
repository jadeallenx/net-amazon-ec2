package Net::Amazon::EC2::ReservedInstance;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::ReservedInstance

=head1 DESCRIPTION

A class representing a reserved instance.

=head1 ATTRIBUTES

=over

=item reserved_instances_id (required)

The ID of the Reserved Instance.

=item instance_type (required)

The instance type on which the Reserved Instance can be used.

=item availability_zone (required)

The Availability Zone in which the Reserved Instance can be used.

=item duration (required)

The duration of the Reserved Instance, in seconds.

=item start (required)

The date and time the Reserved Instance started.

=item usage_price (required)

The usage price of the Reserved Instance, per hour.

=item fixed_price (required)

The purchase price of the Reserved Instance.

=item instance_count (required)

The number of Reserved Instances purchased.

=item product_description (required)

The Reserved Instance description.

=item state (required)

The state of the Reserved Instance purchase.

=back

=cut

has 'reserved_instances_id'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'instance_type'			=> ( is => 'ro', isa => 'Str', required => 1 );
has 'availability_zone'		=> ( is => 'ro', isa => 'Str', required => 1 );
has 'duration'				=> ( is => 'ro', isa => 'Str', required => 1 );
has 'start'					=> ( is => 'ro', isa => 'Str', required => 1 );
has 'usage_price'			=> ( is => 'ro', isa => 'Str', required => 1 );
has 'fixed_price'			=> ( is => 'ro', isa => 'Str', required => 1 );
has 'instance_count'		=> ( is => 'ro', isa => 'Str', required => 1 );
has 'product_description'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'state'					=> ( is => 'ro', isa => 'Str', required => 1 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;