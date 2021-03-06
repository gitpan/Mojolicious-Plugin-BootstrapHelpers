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




#** test from badge-1.mojo, line 1

my $expected_badge_1_1 = qq{
    <span class="badge">3</span></a>
};

get '/badge_1_1' => 'badge_1_1';

$test->get_ok('/badge_1_1')->status_is(200)->trimmed_content_is($expected_badge_1_1, 'Matched trimmed content in badge-1.mojo, line 1');


#** test from badge-1.mojo, line 12

my $expected_badge_1_2 = qq{
    <span class="badge pull-right" data-custom="yes">4</span>
};

get '/badge_1_2' => 'badge_1_2';

$test->get_ok('/badge_1_2')->status_is(200)->trimmed_content_is($expected_badge_1_2, 'Matched trimmed content in badge-1.mojo, line 12');


#** test from badge-1.mojo, line 23

my $expected_badge_1_3 = qq{
    <span class="badge pull-right">Badge 2</span>
};

get '/badge_1_3' => 'badge_1_3';

$test->get_ok('/badge_1_3')->status_is(200)->trimmed_content_is($expected_badge_1_3, 'Matched trimmed content in badge-1.mojo, line 23');


#** test from badge-1.mojo, line 32

my $expected_badge_1_4 = qq{

};

get '/badge_1_4' => 'badge_1_4';

$test->get_ok('/badge_1_4')->status_is(200)->trimmed_content_is($expected_badge_1_4, 'Matched trimmed content in badge-1.mojo, line 32');

done_testing();

__DATA__

@@ badge_1_1.html.ep


    <%= badge '3' %>


@@ badge_1_2.html.ep


    <%= badge '4', data => { custom => 'yes' }, right %>


@@ badge_1_3.html.ep


    %= badge 'Badge 2', right


@@ badge_1_4.html.ep


    % my $empty_badge = '';
    %= badge $empty_badge

