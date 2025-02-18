package MultiSwagger;
use Mojo::Base 'Mojolicious', -signatures;

sub startup ($self) {
  my $config = $self->plugin('NotYAMLConfig');

  foreach my $swagger_file ( glob( 'swagger/*.yml' ) ) {
    $self->plugin(
      'OpenAPI' => {
        spec                 => $swagger_file,
        render_specification => 1,
        schema               => 'v3',
      }
    );
	}

  $self->secrets($config->{secrets});

  my $r = $self->routes;

  $r->get('/')->to('Example#welcome');
}

1;
