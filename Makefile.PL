# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name            'Net-Amazon-EC2';
all_from        'lib/Net/Amazon/EC2.pm';

# Specific dependencies
requires        'LWP::Protocol::https' => 0;
requires        'Digest::SHA'          => 0;
requires        'MIME::Base64'         => 0;
requires        'LWP::UserAgent'       => 0;
requires        'POSIX'                => 0;
requires        'URI'                  => 0;
requires        'URI::Escape'          => 0;
requires        'Params::Validate'     => 0;
requires        'XML::Simple'          => 2.18;
requires        'Moo'                  => '1.000006';
requires        'MooX::Types::MooseLike' => '0.16';
requires        'Carp'                 => 0;
build_requires  'Test::More'           => 0;
build_requires  'Test::Exception'      => 0;

no_index;

repository 'https://github.com/mrallen1/net-amazon-ec2';

auto_install;
WriteAll;
