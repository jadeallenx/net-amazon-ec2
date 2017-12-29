package Net::Amazon::EC2::SecurityGroup;

use Moose;

=head1 NAME

Net::Amazon::EC2::SecurityGroup

=head1 DESCRIPTION

A class representing a security group.

=head1 ATTRIBUTES

=over

=item owner_id (required)

The AWS Access Key ID of the owner of the security group.

=item group_name (required)

The name of the security group.

=item group_id (required)

The id of the security group.

=item group_description (required)

The description of the security group.

=item ip_permissions (optional)

An array ref of Net::Amazon::EC2::IpPermission objects for ingress.

=item ip_permissions_egress (optional)

An array ref of Net::Amazon::EC2::IpPermission objects for egress.

=item vpc_id (optional)

The VPC id of the corresponding security group

=item tag_set (optional)

The set of associated tags for the security group

=cut

has 'owner_id'          => ( is => 'ro', isa => 'Str', required => 1 );
has 'group_name'        => ( is => 'ro', isa => 'Str', required => 1 );
has 'group_id'          => ( is => 'ro', isa => 'Str', required => 1 );
has 'group_description' => ( is => 'ro', isa => 'Str', required => 1 );
has 'ip_permissions'    => ( 
    is          => 'ro', 
    isa         => 'Maybe[ArrayRef[Net::Amazon::EC2::IpPermission]]',
    predicate   => 'has_ip_permissions',
    default		=> sub { [ ] },
);
has 'ip_permissions_egress' => ( 
    is          => 'ro', 
    isa         => 'Maybe[ArrayRef[Net::Amazon::EC2::IpPermission]]',
    predicate   => 'has_ip_permissions_egress',
    default		=> sub { [ ] },
);
has 'vpc_id'           => ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'tag_set'          => ( is => 'ro', isa => 'Maybe[ArrayRef[Net::Amazon::EC2::TagSet]]', required => 0 );

__PACKAGE__->meta->make_immutable();

=back

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Moose;
1;
