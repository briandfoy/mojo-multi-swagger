use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  VERSION   => '0.01',
  PREREQ_PM => {
    'YAML::XS' => '0',
    'Mojolicious' => '9.37',
    'Mojolicious::Plugin::OpenAPI' => '0',
  },
  test => {TESTS => 't/*.t'}
);
