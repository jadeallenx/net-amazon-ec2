package Net::Amazon::EC2::IpPermission;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::IpPermission

=head1 DESCRIPTION

A class representing a rule within the security group.

=head1 ATTRIBUTES

=over

=item ip_protocol (required)

Protocol for the rule. e.g. tcp

=item from_port (required)

Start of port range for the TCP and UDP protocols, or an 
ICMP type number. An ICMP type number of -1 indicates a 
wildcard (i.e., any ICMP type number). 

=item to_port (required)

End of port range for the TCP and UDP protocols, or an 
ICMP code. An ICMP code of -1 indicates a wildcard (i.e., 
any ICMP code). 

=item ip_ranges (optional)

An array ref of Net::Amazon::EC2::IpRange objects to be associated with this rule.

=item groups (optional)

An array ref of Net::Amazon::EC2::UserIdGroupPair objects to be associated with this rule.

=item icmp_port (optional)

For the ICMP protocol, the ICMP type and code must be specified. This must be specified in the format type:code where both are integers. Type, code, 
or both can be specified as -1, which is a wildcard.

=back

=cut

has 'ip_protocol'   => ( is => 'ro', isa => 'Str', required => 1 );
has 'from_port'     => ( is => 'ro', isa => 'Maybe[Int]', required => 1 );
has 'to_port'       => ( is => 'ro', isa => 'Maybe[Int]', required => 1 );
has 'ip_ranges'     => ( 
    is          => 'rw', 
    isa         => 'ArrayRef[Net::Amazon::EC2::IpRange]',
    predicate   => 'has_ip_ranges',
    required    => 0,
);
has 'groups'        => ( 
    is          => 'rw', 
    isa         => 'ArrayRef[Net::Amazon::EC2::UserIdGroupPair]',
    predicate   => 'has_groups',
    required    => 0,
);
has 'icmp_port'		=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;
