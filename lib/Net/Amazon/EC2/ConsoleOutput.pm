package Net::Amazon::EC2::ConsoleOutput;
use Moo;

=head1 NAME

Net::Amazon::EC2::ConsoleOutput

=head1 DESCRIPTION

A class containing the output from an instance's console

=head1 ATTRIBUTES

=over

=item instance_id (required)

The instance id of the output returned.

=item timestamp (required)

The timestamp of when the console output was last updated. 

=item output (required)

The console output itself. 

=back

=cut

has 'instance_id'   => ( is => 'ro', required => 1 );
has 'timestamp'     => ( is => 'ro', required => 1 );
has 'output'        => ( is => 'ro', required => 1 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
