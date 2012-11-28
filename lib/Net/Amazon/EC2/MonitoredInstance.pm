package Net::Amazon::EC2::MonitoredInstance;
use Moo;

=head1 NAME

Net::Amazon::EC2::MonitoredInstance

=head1 DESCRIPTION

A class representing a monitored instance.

=head1 ATTRIBUTES

=over

=item instance_id (required)

The ID of the instance being monitored.

=item state (required)

The state of monitoring of this instance.

=back

=cut

has 'instance_id'	=> ( is => 'ro', required => 1 );
has 'state'			=> ( is => 'ro', required => 1 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
