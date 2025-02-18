package MultiSwagger::Util;
use experimental qw(signatures);

use Exporter qw(import);
our @EXPORT = qw(
	default_message
	header_name
	param_name
	send_response
	);

sub default_message { 'default message' }
sub header_name { 'X-Hello-Message' }
sub param_name  { 'message' }

sub send_response ($c, $message) {
	  $c->render(
		text     => $message,
		format   => 'txt',
		status   => 200,
		);
	}

1;
