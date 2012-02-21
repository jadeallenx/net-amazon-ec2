package Net::Amazon::EC2::DescribeImageAttribute;
use Any::Moose;

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

has 'image_id'              => ( is => 'ro', isa => 'Str', required => 1 );
has 'launch_permissions'    => ( 
    is          => 'ro', 
    isa         => 'Maybe[ArrayRef[Net::Amazon::EC2::LaunchPermission]]',
    predicate   => 'has_launch_permissions',
    required	=> 0,
);
has 'product_codes'         => ( 
    is          => 'ro', 
    isa         => 'Maybe[ArrayRef[Net::Amazon::EC2::ProductCode]]',
    predicate   => 'has_product_codes',
    required	=> 0,
);
has 'kernel'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'ramdisk'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'blockDeviceMapping'         => ( 
    is          => 'ro', 
    isa         => 'Maybe[ArrayRef[Net::Amazon::EC2::BlockDeviceMapping]]',
    required	=> 0,
);
has 'platform'	=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;