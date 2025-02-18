package MultiSwagger::Controller::V1::Hello;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub hello ($c) {
  return unless $c->openapi->valid_input;
  $c->app->log->debug("In hello V1");

  $c->render(
    text     => 'Hello V1',
    format   => 'txt',
    status   => 200,
  	);
  }

1;
