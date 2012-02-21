package Net::Amazon::EC2::ConfirmProductInstanceResponse;
use strict;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::ConfirmProductInstanceResponse

=head1 DESCRIPTION

A class representing the response from a request to attach a product code to a running instance

=head1 ATTRIBUTES

=over

=item return (required)

true if the product code is attached to the instance, false if it is 
not.

=item owner_id (optional)

The instance owner's account ID. Only present if the product code 
is sucessfully attached to the instance.  

=back

=cut

has 'return'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'owner_id'	=> ( is => 'ro', isa => 'Str', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;