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




#** test from button-1.mojo, line 1

my $expected_button_1_1 = qq{
    <button class="btn btn-lg btn-warning">The example 5</button>
};

get '/button_1_1' => 'button_1_1';

$test->get_ok('/button_1_1')->status_is(200)->trimmed_content_is($expected_button_1_1, 'Matched trimmed content in button-1.mojo, line 1');


#** test from button-1.mojo, line 12

my $expected_button_1_2 = qq{
    <a class="btn btn-default btn-sm" href="http://www.example.com/">The example 1</a>
};

get '/button_1_2' => 'button_1_2';

$test->get_ok('/button_1_2')->status_is(200)->trimmed_content_is($expected_button_1_2, 'Matched trimmed content in button-1.mojo, line 12');


#** test from button-1.mojo, line 23

my $expected_button_1_3 = qq{
    <button class="btn btn-primary" type="submit">Save 2</button>
};

get '/button_1_3' => 'button_1_3';

$test->get_ok('/button_1_3')->status_is(200)->trimmed_content_is($expected_button_1_3, 'Matched trimmed content in button-1.mojo, line 23');


#** test from button-1.mojo, line 34

my $expected_button_1_4 = qq{
    <button class="btn btn-primary" disabled="disabled" type="submit">Save 2</button>
};

get '/button_1_4' => 'button_1_4';

$test->get_ok('/button_1_4')->status_is(200)->trimmed_content_is($expected_button_1_4, 'Matched trimmed content in button-1.mojo, line 34');


#** test from button-1.mojo, line 44

my $expected_button_1_5 = qq{
    <a class="btn btn-default" href="/button_1_5">The example 2</a>
};

get '/button_1_5' => 'button_1_5';

$test->get_ok('/button_1_5')->status_is(200)->trimmed_content_is($expected_button_1_5, 'Matched trimmed content in button-1.mojo, line 44');


#** test from button-1.mojo, line 52

my $expected_button_1_6 = qq{
    <a class="btn btn-default" href="panel_1">The example 3</a>
};

get '/button_1_6' => 'button_1_6';

$test->get_ok('/button_1_6')->status_is(200)->trimmed_content_is($expected_button_1_6, 'Matched trimmed content in button-1.mojo, line 52');


#** test from button-1.mojo, line 61

my $expected_button_1_7 = qq{
    <button class="btn btn-default">The example 4</button>
};

get '/button_1_7' => 'button_1_7';

$test->get_ok('/button_1_7')->status_is(200)->trimmed_content_is($expected_button_1_7, 'Matched trimmed content in button-1.mojo, line 61');


#** test from button-1.mojo, line 70

my $expected_button_1_8 = qq{
    <a class="btn btn-default disabled" href="/button_1_8"> The Example 6 </a>
};

get '/button_1_8' => 'button_1_8';

$test->get_ok('/button_1_8')->status_is(200)->trimmed_content_is($expected_button_1_8, 'Matched trimmed content in button-1.mojo, line 70');


#** test from button-1.mojo, line 81

my $expected_button_1_9 = qq{
    <button class="btn btn-default" type="submit">Save 1</button>
};

get '/button_1_9' => 'button_1_9';

$test->get_ok('/button_1_9')->status_is(200)->trimmed_content_is($expected_button_1_9, 'Matched trimmed content in button-1.mojo, line 81');


#** test from button-1.mojo, line 93, loop: active

my $expected_button_1_10_active_active = qq{
    <button class="active btn btn-default">Loop</button>
};

get '/button_1_10_active' => 'button_1_10_active';

$test->get_ok('/button_1_10_active')->status_is(200)->trimmed_content_is($expected_button_1_10_active_active, 'Matched trimmed content in button-1.mojo, line 93, loop: active');


#** test from button-1.mojo, line 93, loop: block

my $expected_button_1_10_block_block = qq{
    <button class="block btn btn-default">Loop</button>
};

get '/button_1_10_block' => 'button_1_10_block';

$test->get_ok('/button_1_10_block')->status_is(200)->trimmed_content_is($expected_button_1_10_block_block, 'Matched trimmed content in button-1.mojo, line 93, loop: block');

done_testing();

__DATA__

@@ button_1_1.html.ep


    %= button 'The example 5' => large, warning


@@ button_1_2.html.ep


    %= button 'The example 1' => ['http://www.example.com/'], small


@@ button_1_3.html.ep


    %= submit_button 'Save 2', primary


@@ button_1_4.html.ep


    %= submit_button 'Save 2', primary, disabled


@@ button_1_5.html.ep


    %= button 'The example 2' => [url_for]


@@ button_1_6.html.ep


    %= button 'The example 3' => ['panel_1']


@@ button_1_7.html.ep


    %= button 'The example 4'


@@ button_1_8.html.ep


    %= button [url_for], disabled, begin
       The Example 6
    %  end


@@ button_1_9.html.ep


    %= submit_button 'Save 1'


@@ button_1_10_active.html.ep


    %= button 'Loop', active


@@ button_1_10_block.html.ep


    %= button 'Loop', block

