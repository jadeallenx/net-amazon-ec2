package Net::Amazon::EC2::InstanceStateChange;
use Moo;

=head1 NAME

Net::Amazon::EC2::InstanceStateChange

=head1 DESCRIPTION

A class representing the change of a state of an instance.

=head1 ATTRIBUTES

=over

=item instance_id (required)

The instance id in question.

=item current_state (required)

A Net::Amazon::EC2::InstanceState object representing the current state of the instance.

=item previous_state (required)

A Net::Amazon::EC2::InstanceState object representing the previous state of the instance.

=back

=cut

has 'instance_id'		=> ( is => 'ro', required => 1 );
has 'current_state'		=> ( is => 'ro', required => 1 );
has 'previous_state'	=> ( is => 'ro', required => 1 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
