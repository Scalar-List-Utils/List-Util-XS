#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

{
  use List::Util::XS qw( first );

  my $hash = {
    'HellO WorlD' => 1,
  };

  is( ( first { 'hello world' eq lc($_) } keys %$hash ), "HellO WorlD",
    'first (lc$_) perserves value' );
}

{
  use List::Util::XS qw( any );

  my $hash = {
    'HellO WorlD' => 1,
  };

  my $var;

  no warnings 'void';
  any { lc($_); $var = $_; } keys %$hash;

  is( $var, 'HellO WorlD',
    'any (lc$_) leaves value undisturbed' );
}
