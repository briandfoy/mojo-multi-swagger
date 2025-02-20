# Mojolicious with multiple swagger files

I didn't know if I'd be able to load more than one Swagger file with [Mojolicious::Plugin::OpenAPI](https://metacpan.org/pod/Mojolicious::Plugin::OpenAPI), so I tried it—no problems.

Call `plugin` as often as you like and it all works out.

  foreach my $swagger_file ( glob( 'swagger/*.yml' ) ) {
    $self->plugin(
      'OpenAPI' => {
        spec                 => $swagger_file,
        render_specification => 1,
        schema               => 'v3',
      }
    );
	}

## Installation

To play with this, install the dependencies:

	cpan -T .

## Run it

Run the server with *morbo*, which automatically picks up changes in
the modules. You need to restart morbo if you change the Swagger files (under *swagger/*):

	morbo ./script/multi-swagger

Access it from a browser. The *mojo* cammand can do this, and *curl* is handy too. You should see different messages from each of these URLs:

The *v1* version of the API requires a form parameter:

	mojo get http://localhost:3000/v2/hello?Hello_there

    curl http://localhost:3000/v1/hello?message=hello+there

The *v2* version of the API requires a request header:

	mojo get -H 'X-Hello-Message: General Kenobi' http://localhost:3000/v2/hello

	curl -H 'X-Hello-Message: General Kenobi" http://localhost:3000/v2/hello

And the *v2* version disallows the `message` parameter so this returns a 400 (Bad Request):

	mojo get http://localhost:3000/v2/hello?message=General+Kenobi

	curl -H 'X-Hello-Message: General Kenobi" http://localhost:3000/v2/hello?message=General+Kenobi

##

* [JSON::Validator](https://metacpan.org/pod/JSON::Validator)
* [mojo get](https://docs.mojolicious.org/Mojolicious/Command/get)
* [Mojolicious::Plugin::OpenAPI](https://metacpan.org/pod/Mojolicious::Plugin::OpenAPI)



