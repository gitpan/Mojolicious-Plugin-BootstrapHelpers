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




#** test from nav-1.mojo, line 1

my $expected_nav_1_1 = qq{
    <ul class="nav nav-pills">
        <li><a href="#">Item 1</a></li>
        <li class="active"><a href="#">Item 2</a></li>
        <li><a href="#">Item 3</a></li>
        <li class="disabled"><a href="#">Item 4</a></li>
    </ul>
};

get '/nav_1_1' => 'nav_1_1';

$test->get_ok('/nav_1_1')->status_is(200)->trimmed_content_is($expected_nav_1_1, 'Matched trimmed content in nav-1.mojo, line 1');


#** test from nav-1.mojo, line 20

my $expected_nav_1_2 = qq{
    <ul class="nav nav-justified nav-tabs">
        <li><a href="#">Item 1</a></li>
        <li class="active"><a href="#">Item 2</a></li>
        <li><a href="#">Item 3</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">There are...</a></li>
                <li><a href="#">...three...</a></li>
                <li class="divider"></li>
                <li><a href="#">...choices</a></li>
            </ul>
        </li>
    </ul>
};

get '/nav_1_2' => 'nav_1_2';

$test->get_ok('/nav_1_2')->status_is(200)->trimmed_content_is($expected_nav_1_2, 'Matched trimmed content in nav-1.mojo, line 20');

done_testing();

__DATA__

@@ nav_1_1.html.ep


    <%= nav pills => [
                ['Item 1', ['#'] ],
                ['Item 2', ['#'], active ],
                ['Item 3', ['#'] ],
                ['Item 4', ['#'], disabled ],
            ]
    %>


@@ nav_1_2.html.ep


    <%= nav justified, tabs => [
                ['Item 1', ['#'] ],
                ['Item 2', ['#'], active ],
                ['Item 3', ['#'] ],
                {
                    button => ['Dropdown', ['#'], caret],
                    items => [
                        ['There are...', ['#'] ],
                        ['...three...', ['#'] ],
                        [],
                        ['...choices', ['#'] ],
                    ],
                },
            ]
    %>

