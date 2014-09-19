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




#** test from navbar-1.mojo, line 1

my $expected_navbar_1_1 = qq{
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button class="collapsed navbar-toggle" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">The brand</a>
            </div>
        </div>
    </nav>
};

get '/navbar_1_1' => 'navbar_1_1';

$test->get_ok('/navbar_1_1')->status_is(200)->trimmed_content_is($expected_navbar_1_1, 'Matched trimmed content in navbar-1.mojo, line 1');


#** test from navbar-1.mojo, line 20

my $expected_navbar_1_2 = qq{
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button class="collapsed navbar-toggle" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" type="button">
                    <span>Expand</span>
                </button>
                <a class="navbar-brand" href="#">The brand</a>
            </div>
        </div>
    </nav>
};

get '/navbar_1_2' => 'navbar_1_2';

$test->get_ok('/navbar_1_2')->status_is(200)->trimmed_content_is($expected_navbar_1_2, 'Matched trimmed content in navbar-1.mojo, line 20');


#** test from navbar-1.mojo, line 46

my $expected_navbar_1_3 = qq{
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button class="collapsed navbar-toggle" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">The brand</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">Link</a></li>
                    <li class="active"><a href="#">Another link</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Choice 1</a></li>
                            <li><a href="#">Choice 2</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Choice 3</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
};

get '/navbar_1_3' => 'navbar_1_3';

$test->get_ok('/navbar_1_3')->status_is(200)->trimmed_content_is($expected_navbar_1_3, 'Matched trimmed content in navbar-1.mojo, line 46');

done_testing();

__DATA__

@@ navbar_1_1.html.ep


    <%= navbar header => ['The brand', ['#'], hamburger, toggler => 'bs-example-navbar-collapse-1'], [] %>


@@ navbar_1_2.html.ep


    <%= navbar html_header => qq{
            <div class="navbar-header">
                <button class="collapsed navbar-toggle" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" type="button">
                    <span>Expand</span>
                </button>
                <a class="navbar-brand" href="#">The brand</a>
            </div>
    }, [] %>


@@ navbar_1_3.html.ep


    <%= navbar header => ['The brand', ['#'], hamburger, toggler => 'bs-example-navbar-collapse-1'],
               [
                    {
                        nav => [
                            [
                                ['Link', ['#'] ],
                                ['Another link', ['#'], active ],
                                {
                                    button => ['Menu', ['#'], caret ],
                                    items => [
                                        ['Choice 1', ['#'] ],
                                        ['Choice 2', ['#'] ],
                                        [],
                                        ['Choice 3', ['#'] ],
                                    ]
                                }
                            ]
                        ]
                    }
               ]
    %>

