package MultiSwagger::Controller::V1::Hello;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub hello ($c) {
  return unless $c->openapi->valid_input;
  $c->app->log->debug("In hello V1");

  my $message = $c->param('message') // 'default message';

  $c->render(
    text     => $message,
    format   => 'txt',
    status   => 200,
  	);
  }

1;
