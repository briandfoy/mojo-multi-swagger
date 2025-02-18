package MultiSwagger::Controller::V2::Hello;
use Mojo::Base 'Mojolicious::Controller', -signatures;

use MultiSwagger::Util qw(header_name param_name send_response);

sub hello ($c) {
  return unless $c->openapi->valid_input;
  $c->app->log->debug("In hello V2");

  my $params = $c->req->query_params->to_hash;
  if( exists $params->{param_name()} ) {
  	return $c->render(
  		status => '400',
  		format => 'txt',
  		text   => sprintf "V2 uses the %s header instead of the %s query param", header_name(), param_name()
  		)
  	}


  $c->send_response( $c->get_message );
  }

sub get_message ($c) {
	my $message = $c->req->headers->header(header_name()) // default_message();
	}

1;
