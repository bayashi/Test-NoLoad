use strict;
use Test::More;

BEGIN {
    use_ok 'Test::NoLoad';
}

check_no_load(qw/
    Moose
/);

done_testing;