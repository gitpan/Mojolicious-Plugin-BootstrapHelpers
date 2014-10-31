use Mojo::Base -strict;

BEGIN {
    $ENV{'MOJO_NO_IPV6'} = 1;
    $ENV{'MOJO_REACTOR'} = 'Mojo::Reactor::Poll';
}

use Test::More;
use Mojolicious::Lite;
use Test::Mojo::Trim;

plugin 'BootstrapHelpers', {
    icons => {
        class => 'glyphicon',
        formatter => 'glyphicon-%s',
    },
};

ok 1;

my $test = Test::Mojo::Trim->new;




#** test from bootstrap-1.mojo, line 1

my $expected_bootstrap_1_1 = qq{
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
};

get '/bootstrap_1_1' => 'bootstrap_1_1';

$test->get_ok('/bootstrap_1_1')->status_is(200)->trimmed_content_is($expected_bootstrap_1_1, 'Matched trimmed content in bootstrap-1.mojo, line 1');


#** test from bootstrap-1.mojo, line 9

my $expected_bootstrap_1_2 = qq{
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
};

get '/bootstrap_1_2' => 'bootstrap_1_2';

$test->get_ok('/bootstrap_1_2')->status_is(200)->trimmed_content_is($expected_bootstrap_1_2, 'Matched trimmed content in bootstrap-1.mojo, line 9');


#** test from bootstrap-1.mojo, line 18

my $expected_bootstrap_1_3 = qq{
     <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
};

get '/bootstrap_1_3' => 'bootstrap_1_3';

$test->get_ok('/bootstrap_1_3')->status_is(200)->trimmed_content_is($expected_bootstrap_1_3, 'Matched trimmed content in bootstrap-1.mojo, line 18');


#** test from bootstrap-1.mojo, line 26

my $expected_bootstrap_1_4 = qq{
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
};

get '/bootstrap_1_4' => 'bootstrap_1_4';

$test->get_ok('/bootstrap_1_4')->status_is(200)->trimmed_content_is($expected_bootstrap_1_4, 'Matched trimmed content in bootstrap-1.mojo, line 26');


#** test from bootstrap-1.mojo, line 36

my $expected_bootstrap_1_5 = qq{
        <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
};

get '/bootstrap_1_5' => 'bootstrap_1_5';

$test->get_ok('/bootstrap_1_5')->status_is(200)->trimmed_content_is($expected_bootstrap_1_5, 'Matched trimmed content in bootstrap-1.mojo, line 36');


#** test from bootstrap-1.mojo, line 45

my $expected_bootstrap_1_6 = qq{
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
};

get '/bootstrap_1_6' => 'bootstrap_1_6';

$test->get_ok('/bootstrap_1_6')->status_is(200)->trimmed_content_is($expected_bootstrap_1_6, 'Matched trimmed content in bootstrap-1.mojo, line 45');

done_testing();

__DATA__

@@ bootstrap_1_1.html.ep


    %= bootstrap


@@ bootstrap_1_2.html.ep


    %= bootstrap 'css'


@@ bootstrap_1_3.html.ep


    %= bootstrap 'js'


@@ bootstrap_1_4.html.ep


    %= bootstrap 'all'


@@ bootstrap_1_5.html.ep


    %= bootstrap 'jsq'


@@ bootstrap_1_6.html.ep


    %= bootstrap 'allq'

