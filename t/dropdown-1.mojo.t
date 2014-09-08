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



#** test from dropdown-1.mojo, line 1

my $expected_dropdown_1_1 = qq{     <div class="dropdown">
        <button class="btn btn-default dropdown-toggle" type="button" id="a_custom_id" data-toggle="dropdown">Dropdown 1</button>
        <ul class="dropdown-menu">
            <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
            <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
        </ul>
    </div> };

get '/dropdown_1_1' => 'dropdown_1_1';

$test->get_ok('/dropdown_1_1')->status_is(200)->trimmed_content_is($expected_dropdown_1_1, 'Matched trimmed content in dropdown-1.mojo, line 1');

#** test from dropdown-1.mojo, line 25

my $expected_dropdown_1_2 = qq{     <div class="dropdown">
        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Dropdown 2<span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="menuitem" href="item1" tabindex="-1" data-attr="2">Item 1</a></li>
            <li><a class="menuitem" href="item2" tabindex="-1" data-attr="4">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1" data-attr="7">Item 3</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item4" tabindex="4">Item 4</a></li>
        </ul>
    </div>
 };

get '/dropdown_1_2' => 'dropdown_1_2';

$test->get_ok('/dropdown_1_2')->status_is(200)->trimmed_content_is($expected_dropdown_1_2, 'Matched trimmed content in dropdown-1.mojo, line 25');

done_testing();

__DATA__

@@ dropdown_1_1.html.ep

    <%= dropdown 'Dropdown 1',
         button => [id => 'a_custom_id'],
         items => [
            ['Item 1', ['item1'] ],
            ['Item 2', ['item2'] ],
            divider,
            ['Item 3', ['item3'] ]
         ] %>

@@ dropdown_1_2.html.ep

    <%= dropdown 'Dropdown 2', caret,
         items => [
            ['Item 1', ['item1'], data => { attr => 2 } ],
            ['Item 2', ['item2'], data => { attr => 4 } ],
            divider,
            ['Item 3', ['item3'], data => { attr => 7 } ],
            divider,
            ['Item 4', ['item4'], tabindex => 4 ],
         ] %>

