package Net::Amazon::EC2::BundleInstanceResponse;
use Any::Moose;

=head1 NAME

Net::Amazon::EC2::BundleInstanceResponse

=head1 DESCRIPTION

A class representing a bundled instance

=head1 ATTRIBUTES

=over

=item instance_id (required)

Instance associated with this bundle task.

=item bundle_id (required)

Identifier for this task.

=item state (required)

The state of this bundling task.

=item start_time (required)

The time the bundle task started

=item update_time (required)

The time of the most recent update for the bundle.

=item progress (required)

A percentage description of the progress of the task, such as 94%.

=item s3_bucket (required)

The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.

=item s3_prefix (required)

Specifies the beginning of the file name of the AMI.

=item s3_aws_access_key_id (required)

The Access Key ID of the owner of the Amazon S3 bucket.

=item s3_upload_policy (required)

An Amazon S3 upload policy that gives Amazon EC2 permission to upload items into Amazon S3 on the user's behalf.

=item s3_policy_upload_signature (required)

The signature of the Base64 encoded JSON document.

=item bundle_error_code (optional)

Error code for bundle failure.

=item bundle_error_message (optional)

Error message associated with bundle failure.

=back

=cut

has 'instance_id'					=> ( is => 'ro', isa => 'Str', required => 1 );
has 'bundle_id'						=> ( is => 'ro', isa => 'Str', required => 1 );
has 'state'							=> ( is => 'ro', isa => 'Str', required => 1 );
has 'start_time'					=> ( is => 'ro', isa => 'Str', required => 1 );
has 'update_time'					=> ( is => 'ro', isa => 'Str', required => 1 );
has 'progress'						=> ( is => 'ro', isa => 'Str', required => 1 );
has 's3_bucket'						=> ( is => 'ro', isa => 'Str', required => 1 );
has 's3_prefix'						=> ( is => 'ro', isa => 'Str', required => 1 );
has 's3_aws_access_key_id'			=> ( is => 'ro', isa => 'Str', required => 1 );
has 's3_upload_policy'				=> ( is => 'ro', isa => 'Str', required => 1 );
has 's3_policy_upload_signature'	=> ( is => 'ro', isa => 'Str', required => 1 );
has 'bundle_error_code'				=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );
has 'bundle_error_message'			=> ( is => 'ro', isa => 'Maybe[Str]', required => 0 );

__PACKAGE__->meta->make_immutable();

=head1 AUTHOR

Jeff Kim <cpan@chosec.com>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Jeff Kim. This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

no Any::Moose;
1;