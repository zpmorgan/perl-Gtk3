#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

BEGIN { require Gtk3; }
my $success = eval { Gtk3->import; 1 };
BAIL_OUT ("Cannot load Gtk3: $@")
  unless $success;

plan tests => 1;

SKIP: {
  @ARGV = qw(--help --name gtk2perl --urgs tree);
  skip 'Gtk3::init_check failed, probably unable to open DISPLAY', 1
    unless Gtk3::init_check ();
  Gtk3::init ();
  is_deeply (\@ARGV, [qw(--help --urgs tree)]);
}
