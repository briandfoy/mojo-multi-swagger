# Mojolicious with multiple swagger files

I didn't know if I'd be able to load more than one Swagger file with [Mojolicious::Plugin::OpenAPI](https://metacpan.org/pod/Mojolicious::Plugin::OpenAPI), so I tried it—no problems.

To play with this, install the dependencies:

	cpan -T .

Run the server with *morbo*, which automatically picks up changes in
the modules. You need to restart morbo if you change the Swagger files (under *swagger/*):

	morbo ./script/multi-swagger

Access it from the browser. You should see different messages from each of these URLs:

The *v1* version of the API requires a form parameter:

    curl http://localhost:3000/v1/hello?message=hello+there

The *v2* version of the API requires a request header:

	curl -H 'X-Hello-Message: General Kenobi" http://localhost:3000/v2/hello
