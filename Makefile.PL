# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name            'Net-Amazon-EC2';
all_from        'lib/Net/Amazon/EC2.pm';

# Specific dependencies
recommends	'LWP::Protocol::https'	=> 0;
requires        'Digest::HMAC_SHA1'	=> 1.01;
requires		'MIME::Base64'		=> 0;
requires		'LWP::UserAgent'	=> 0;
requires		'HTTP::Date'		=> 0;
requires		'URI'				=> 0;
requires		'Params::Validate'	=> 0;
requires		'XML::Simple'		=> 2.18;
requires        'Any::Moose'        => 0.18;
build_requires  'Test::More'        => 0;

no_index;

repository 'https://github.com/mrallen1/net-amazon-ec2';

auto_install;
WriteAll;
