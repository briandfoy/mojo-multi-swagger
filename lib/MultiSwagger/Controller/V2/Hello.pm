package MultiSwagger::Controller::V2::Hello;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub hello ($c) {
  return unless $c->openapi->valid_input;
  $c->app->log->debug("In hello V2");

  $c->render(
    text     => 'Hello V2',
    format   => 'txt',
    status   => 200,
  	);
  }

1;
