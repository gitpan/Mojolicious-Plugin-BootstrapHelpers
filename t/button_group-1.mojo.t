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




#** test from button_group-1.mojo, line 1

my $expected_button_group_1_1 = qq{
    <div class="btn-group">
        <button class="btn btn-default" type="button">Button 1</button>
        <button class="btn btn-default" type="button">Button 2</button>
        <button class="btn btn-default" type="button">Button 3</button>
    </div>
};

get '/button_group_1_1' => 'button_group_1_1';

$test->get_ok('/button_group_1_1')->status_is(200)->trimmed_content_is($expected_button_group_1_1, 'Matched trimmed content in button_group-1.mojo, line 1');


#** test from button_group-1.mojo, line 20

my $expected_button_group_1_2 = qq{
    <div class="btn-group btn-group-sm">
        <button class="btn btn-default" type="button">Button 1</button>
        <div class="btn-group btn-group-sm">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Dropdown 1 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
        <button class="btn btn-default" type="button">Button 2</button>
        <button class="btn btn-default" type="button">Button 3</button>
    </div>
};

get '/button_group_1_2' => 'button_group_1_2';

$test->get_ok('/button_group_1_2')->status_is(200)->trimmed_content_is($expected_button_group_1_2, 'Matched trimmed content in button_group-1.mojo, line 20');

done_testing();

__DATA__

@@ button_group_1_1.html.ep


    <%= buttongroup
        buttons => [
            ['Button 1'],
            ['Button 2'],
            ['Button 3'],
        ]
    %>


@@ button_group_1_2.html.ep


    <%= buttongroup small,
        buttons => [
            ['Button 1'],
            { button => ['Dropdown 1', caret],
              items => [
                  ['Item 1', ['item1'] ],
                  ['Item 2', ['item2'] ],
                  [],
                  ['Item 3', ['item3'] ],
              ],
            },
            ['Button 2'],
            ['Button 3'],
        ],
    %>

