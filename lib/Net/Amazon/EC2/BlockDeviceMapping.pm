package Net::Amazon::EC2::BlockDeviceMapping;
use Moo;

=head1 NAME

Net::Amazon::EC2::BlockDeviceMapping

=head1 DESCRIPTION

A class representing a block device mapping

=head1 ATTRIBUTES

=over

=item device_name (required)

Name of the device within Amazon EC2. 

=item ebs (optional)

A Net::Amazon::EC2::EbsInstanceBlockDeviceMapping object representing the EBS mapping

=item virtual_name (optional)

A virtual device name.

=item no_device (optional)

Specifies the device name to suppress during instance launch.

=back

=cut

has 'device_name'	=> ( is => 'ro', required => 1 );
has 'ebs'			=> ( is => 'ro', required => 0 );
has 'virtual_name'	=> ( is => 'ro', required => 0 );
has 'no_device'		=> ( is => 'ro', required => 0 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
