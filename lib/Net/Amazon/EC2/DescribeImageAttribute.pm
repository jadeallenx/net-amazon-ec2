package Net::Amazon::EC2::DescribeImageAttribute;
use Moo;

=head1 NAME

Net::Amazon::EC2::DescribeImageAttribute

=head1 DESCRIPTION

A class representing the attributes associated with a machine image.

=head1 ATTRIBUTES

=over

=item image_id (required)

Image ID you are describing the image attributes of.

=item launch_permissions (optional)

An array ref of Net::Amazon::EC2::LaunchPermission objects. 

=item product_codes (optional)

An array ref of Net::Amazon::EC2::ProductCode objects.

=item kernel (optional)

ID of the kernel associated with the AMI. Returned if kernel is 
specified.

=item ramdisk (optional)

ID of the RAM disk associated with the AMI. Returned if ramdisk 
is specified.

=item block_device_mapping (optional)

An array ref of Net::Amazon::EC2::BlockDeviceMapping objects.

=item platform (optional)

Describes the operating system platform.

=back

=cut

has 'image_id'              => ( is => 'ro', required => 1 );
has 'launch_permissions'    => ( 
    is          => 'ro', 
    predicate   => 1,
    required	=> 0,
);
has 'product_codes'         => ( 
    is          => 'ro', 
    predicate   => 1,
    required	=> 0,
);
has 'kernel'	=> ( is => 'ro', required => 0 );
has 'ramdisk'	=> ( is => 'ro', required => 0 );
has 'blockDeviceMapping'         => ( 
    is          => 'ro', 
    required	=> 0,
);
has 'platform'	=> ( is => 'ro', required => 0 );

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
