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


#** test from button_group-1.mojo, line 59

my $expected_button_group_1_3 = qq{
    <div class="btn-group-vertical">
        <button class="btn btn-default" type="button">Button 1</button>
        <div class="btn-group">
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

get '/button_group_1_3' => 'button_group_1_3';

$test->get_ok('/button_group_1_3')->status_is(200)->trimmed_content_is($expected_button_group_1_3, 'Matched trimmed content in button_group-1.mojo, line 59');


#** test from button_group-1.mojo, line 97

my $expected_button_group_1_4 = qq{
    <div class="btn-group btn-group-justified">
        <div class="btn-group">
            <button class="btn btn-default" type="button">Button 1</button>
        </div>
        <div class="btn-group">
            <button class="btn btn-default" type="button">Button 2</button>
        </div>
        <div class="btn-group">
            <button class="btn btn-default" type="button">Button 3</button>
        </div>
    </div>
};

get '/button_group_1_4' => 'button_group_1_4';

$test->get_ok('/button_group_1_4')->status_is(200)->trimmed_content_is($expected_button_group_1_4, 'Matched trimmed content in button_group-1.mojo, line 97');


#** test from button_group-1.mojo, line 122

my $expected_button_group_1_5 = qq{
    <div class="btn-group btn-group-justified">
        <a class="btn btn-default" href="http://www.example.com/">Link 1</a>
        <a class="btn btn-default" href="http://www.example.com/">Link 2</a>
        <div class="btn-group dropup">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Dropup 1 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
    </div>
};

get '/button_group_1_5' => 'button_group_1_5';

$test->get_ok('/button_group_1_5')->status_is(200)->trimmed_content_is($expected_button_group_1_5, 'Matched trimmed content in button_group-1.mojo, line 122');


#** test from button_group-1.mojo, line 159

my $expected_button_group_1_6 = qq{
    <div class="btn-group">
        <a class="btn btn-default" href="http://www.example.com/">Link 1</a>
        <div class="btn-group">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
    </div>
};

get '/button_group_1_6' => 'button_group_1_6';

$test->get_ok('/button_group_1_6')->status_is(200)->trimmed_content_is($expected_button_group_1_6, 'Matched trimmed content in button_group-1.mojo, line 159');


#** test from button_group-1.mojo, line 193

my $expected_button_group_1_7 = qq{
    <div class="btn-group">
        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Default <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
            <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
        </ul>
    </div>

    <div class="btn-group">
        <button class="btn btn-danger btn-lg dropdown-toggle" type="button" data-toggle="dropdown">Big danger <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
            <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
        </ul>
    </div>
};

get '/button_group_1_7' => 'button_group_1_7';

$test->get_ok('/button_group_1_7')->status_is(200)->trimmed_content_is($expected_button_group_1_7, 'Matched trimmed content in button_group-1.mojo, line 193');

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


@@ button_group_1_3.html.ep


    <%= buttongroup vertical,
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


@@ button_group_1_4.html.ep


    <%= buttongroup justified,
        buttons => [
            ['Button 1'],
            ['Button 2'],
            ['Button 3'],
        ]
    %>


@@ button_group_1_5.html.ep


    <%= buttongroup justified,
        buttons => [
            ['Link 1', ['http://www.example.com/'] ],
            ['Link 2', ['http://www.example.com/'] ],
            { dropup,
              button => ['Dropup 1', caret],
              items => [
                  ['Item 1', ['item1'] ],
                  ['Item 2', ['item2'] ],
                  [],
                  ['Item 3', ['item3'] ],
              ],
            },
        ]
    %>


@@ button_group_1_6.html.ep


    <%= buttongroup
        buttons => [
            ['Link 1', ['http://www.example.com/'] ],
            { button => [undef, caret],
              items => [
                  ['Item 1', ['item1'] ],
                  ['Item 2', ['item2'] ],
                  [],
                  ['Item 3', ['item3'] ],
              ],
            },
        ]
    %>


@@ button_group_1_7.html.ep


    <%= buttongroup { button => ['Default', caret],
                      items  => [
                          ['Item 1', ['item1'] ],
                          ['Item 2', ['item2'] ],
                          [],
                          ['Item 3', ['item3'] ],
                      ],
                    }
    %>

    <%= buttongroup { button => ['Big danger', caret, large, danger],
                      items  => [
                          ['Item 1', ['item1'] ],
                          ['Item 2', ['item2'] ],
                          [],
                          ['Item 3', ['item3'] ],
                      ],
                    }
    %>

