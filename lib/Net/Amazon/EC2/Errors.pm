package Net::Amazon::EC2::Errors;
use Moo;
use MooX::Types::MooseLike::Base;

=head1 NAME

Net::Amazon::EC2::Errors

=head1 DESCRIPTION

A class representing one or more errors from an API request.

=head1 ATTRIBUTES

=over

=item request_id (required)

The ID of the request associated with this error.

=item errors (required)

An array ref of Net::Amazon::EC2::Error objects associated with this request.

=cut

use overload '""' => 'as_string';

has 'request_id'    => ( is => 'ro', isa => Str, required => 1 );

has 'errors'        => ( 
    is          => 'rw', 
    predicate   => 1,
    required    => 1,
);

sub as_string {
  my $self = shift;
  my $errors = join '', map { '['.$_->code.'] '.$_->message."\n" } @{$self->errors};
  return "Amazon EC2 Errors [Request ".$self->request_id."]:\n$errors"
}

=back

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
