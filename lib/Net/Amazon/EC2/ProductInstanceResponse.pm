package Net::Amazon::EC2::ProductInstanceResponse;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::ProductInstanceResponse

=head1 DESCRIPTION

A class representing the response from a confirm_product_instance call.

=head1 ATTRIBUTES

=over

=item product_code (required)

The product code attached to the instance.

=item instance_id (required)

Instance ID.

=item owner_id (required)

AWS Account id of the instance owner.

=cut

has 'product_code'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'instance_id'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'owner_id'		=> ( is => 'ro', isa => 'Str', required => 1 );

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