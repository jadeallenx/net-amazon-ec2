package Net::Amazon::EC2::BlockDeviceMapping;
use strict;
use Any::Moose;

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

has 'device_name'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'ebs'			=> ( is => 'ro', isa => 'Maybe[Net::Amazon::EC2::EbsBlockDevice]|Maybe[Net::Amazon::EC2::EbsInstanceBlockDeviceMapping]', required => 0 );
has 'virtual_name'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'no_device'		=> ( is => 'ro', isa => 'Maybe[Int]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;