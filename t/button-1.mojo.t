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




#** test from button-1.mojo, line 2

my $expected_button_1_1 = qq{     <a class="btn btn-default btn-sm" href="http://www.example.com/">The example 1</a> };

get '/button_1_1' => 'button_1_1';

$test->get_ok('/button_1_1')->status_is(200)->trimmed_content_is($expected_button_1_1, 'Matched trimmed content in button-1.mojo, line 2');

#** test from button-1.mojo, line 10

my $expected_button_1_2 = qq{     <a class="btn btn-default" href="/button_1_2">The example 2</a> };

get '/button_1_2' => 'button_1_2';

$test->get_ok('/button_1_2')->status_is(200)->trimmed_content_is($expected_button_1_2, 'Matched trimmed content in button-1.mojo, line 10');

#** test from button-1.mojo, line 18

my $expected_button_1_3 = qq{     <a class="btn btn-default" href="panel_1">The example 3</a>     };

get '/button_1_3' => 'button_1_3';

$test->get_ok('/button_1_3')->status_is(200)->trimmed_content_is($expected_button_1_3, 'Matched trimmed content in button-1.mojo, line 18');

#** test from button-1.mojo, line 27

my $expected_button_1_4 = qq{     <button class="btn btn-default">The example 4</button> };

get '/button_1_4' => 'button_1_4';

$test->get_ok('/button_1_4')->status_is(200)->trimmed_content_is($expected_button_1_4, 'Matched trimmed content in button-1.mojo, line 27');

#** test from button-1.mojo, line 36

my $expected_button_1_5 = qq{     <button class="btn btn-lg btn-warning">The example 5</button> };

get '/button_1_5' => 'button_1_5';

$test->get_ok('/button_1_5')->status_is(200)->trimmed_content_is($expected_button_1_5, 'Matched trimmed content in button-1.mojo, line 36');

#** test from button-1.mojo, line 45

my $expected_button_1_6 = qq{     <a class="btn btn-default disabled" href="/button_1_6"> The Example 6 </a> };

get '/button_1_6' => 'button_1_6';

$test->get_ok('/button_1_6')->status_is(200)->trimmed_content_is($expected_button_1_6, 'Matched trimmed content in button-1.mojo, line 45');

#** test from button-1.mojo, line 56

my $expected_button_1_7 = qq{     <button class="btn btn-default" type="submit">Save 1</button> };

get '/button_1_7' => 'button_1_7';

$test->get_ok('/button_1_7')->status_is(200)->trimmed_content_is($expected_button_1_7, 'Matched trimmed content in button-1.mojo, line 56');

#** test from button-1.mojo, line 65

my $expected_button_1_8 = qq{     <button class="btn btn-primary" disabled="disabled" type="submit">Save 2</button> };

get '/button_1_8' => 'button_1_8';

$test->get_ok('/button_1_8')->status_is(200)->trimmed_content_is($expected_button_1_8, 'Matched trimmed content in button-1.mojo, line 65');

#** test from button-1.mojo, line 74, loop: active

my $expected_button_1_9_active_active = qq{     <button class="active btn btn-default">Loop</button> };

get '/button_1_9_active' => 'button_1_9_active';

$test->get_ok('/button_1_9_active')->status_is(200)->trimmed_content_is($expected_button_1_9_active_active, 'Matched trimmed content in button-1.mojo, line 74, loop: active');

#** test from button-1.mojo, line 74, loop: block

my $expected_button_1_9_block_block = qq{     <button class="block btn btn-default">Loop</button> };

get '/button_1_9_block' => 'button_1_9_block';

$test->get_ok('/button_1_9_block')->status_is(200)->trimmed_content_is($expected_button_1_9_block_block, 'Matched trimmed content in button-1.mojo, line 74, loop: block');

done_testing();

__DATA__

@@ button_1_1.html.ep

    %= button 'The example 1' => ['http://www.example.com/'], small

@@ button_1_2.html.ep

    %= button 'The example 2' => [url_for]

@@ button_1_3.html.ep

    %= button 'The example 3' => ['panel_1']

@@ button_1_4.html.ep

    %= button 'The example 4'

@@ button_1_5.html.ep

    %= button 'The example 5' => large, warning

@@ button_1_6.html.ep

    %= button [url_for], disabled, begin
       The Example 6
    %  end

@@ button_1_7.html.ep

    %= submit_button 'Save 1'

@@ button_1_8.html.ep

    %= submit_button 'Save 2', primary, disabled

@@ button_1_9_active.html.ep

    %= button 'Loop', active

@@ button_1_9_block.html.ep

    %= button 'Loop', block
