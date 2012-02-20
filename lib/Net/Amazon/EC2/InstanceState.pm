package Net::Amazon::EC2::InstanceState;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::InstanceState

=head1 DESCRIPTION

A class representing the state of an instance.

=head1 ATTRIBUTES

=over

=item code (required)

An interger representing the instance state. Valid values are:

=over

=item * 0: pending 

=item * 16: running 

=item * 32: shutting-down 

=item * 48: terminated

=item * 64: stopping

=item * 80: stopped

=back

=item name (required)

The current named state of the instance. Valid values are:

=over

=item * pending: the instance is in the process of being launched 

=item * running: the instance launched (though booting may not be completed) 

=item * shutting-down: the instance started shutting down 

=item * terminated: the instance terminated 

=item * stopping: the instance is in the process of stopping

=item * stopped: the instance has been stopped

=back

=cut

has 'code'  => ( is => 'ro', isa => 'Int' );
has 'name'  => ( is => 'ro', isa => 'Str' );

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