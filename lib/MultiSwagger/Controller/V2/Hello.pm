package MultiSwagger::Controller::V2::Hello;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub hello ($c) {
  return unless $c->openapi->valid_input;
  $c->app->log->debug("In hello V2");

  my $message = $c->req->headers->header('X-Hello-Message') // 'default message';

  $c->render(
    text     => $message,
    format   => 'txt',
    status   => 200,
  	);
  }

1;
