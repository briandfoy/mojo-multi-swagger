# Mojolicious with multiple swagger files

I didn't know if I'd be able to load more than one Swagger file with [Mojolicious::Plugin::OpenAPI](https://metacpan.org/pod/Mojolicious::Plugin::OpenAPI), so I tried it—no problems.

To play with this, install the dependencies:

	cpan -T .

Run the server with *morbo*, which automatically picks up changes in
the modules:

	morbo ./script/multi-swagger

Access it from the browser. You should see different messages from each of these URLs:

    curl http://localhost:3000/v1/hello

	curl http://localhost:3000/v2/hello
