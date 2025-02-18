package MultiSwagger::Controller::V1::Hello;
use Mojo::Base 'Mojolicious::Controller', -signatures;

use MultiSwagger::Util qw(default_message header_name param_name send_response);

sub hello ($c) {
  return unless $c->openapi->valid_input;
  $c->app->log->debug("In hello V1");

  $c->send_response( $c->get_message );
  }

sub get_message ($c) {
	my $message = $c->param(param_name()) // default_message();
	}

1;
