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


#** test from navbar-1.mojo, line 98

my $expected_navbar_1_4 = qq{
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button class="collapsed navbar-toggle" data-target="#collapse-45821" data-toggle="collapse" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">The Brand</a>
            </div>
            <div class="collapse navbar-collapse" id="collapse-45821">
                <form action="/login" class="navbar-form navbar-left" method="post">
                    <div class="form-group">
                        <input class="form-control" id="search-term" name="search_term" placeholder="Search" type="text" />
                    </div>
                    <button class="btn btn-default" type="submit">Submit</button>
                </form>
                <a class="btn btn-default navbar-btn navbar-left" href="#">A link</a>
                <ul class="nav navbar-nav">
                    <li><a href="#">Another linkage</a></li>
                </ul>
                <p class="navbar-right navbar-text">Hello</p>
            </div>
        </div>
    </nav>
};

get '/navbar_1_4' => 'navbar_1_4';

$test->get_ok('/navbar_1_4')->status_is(200)->trimmed_content_is($expected_navbar_1_4, 'Matched trimmed content in navbar-1.mojo, line 98');


#** test from navbar-1.mojo, line 151

my $expected_navbar_1_5 = qq{
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="collapsed navbar-toggle" data-toggle="collapse" data-target="#collapse-4124">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>
            <div class="collapse navbar-collapse" id="collapse-4124">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Link</a></li>
                    <li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <form action="/login" class="navbar-form navbar-left" method="post">
                    <div class="form-group">
                        <input class="form-control" id="the-search" name="the_search" placeholder="Search" type="text" />
                    </div>
                    <button class="btn btn-default" type="submit">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
};

get '/navbar_1_5' => 'navbar_1_5';

$test->get_ok('/navbar_1_5')->status_is(200)->trimmed_content_is($expected_navbar_1_5, 'Matched trimmed content in navbar-1.mojo, line 151');

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
               ]
    %>


@@ navbar_1_4.html.ep


    <%= navbar inverse, header => ['The Brand', ['#'], hamburger, toggler => 'collapse-45821'],
               [
                    form => [
                        [['/login'], method => 'post', left],
                        [
                            formgroup => [
                                undef,
                                text_field => ['search-term', placeholder => 'Search' ],
                            ],
                            submit_button => ['Submit'],
                        ]
                    ],
                    button => ['A link', ['#'], left ],
                    nav => [
                        [
                            ['Another linkage', ['#'] ]
                        ]
                    ],
                    p => ['Hello', right]
               ]
    %>


@@ navbar_1_5.html.ep


<%= navbar header => ['Brand', ['#'], hamburger, toggler => 'collapse-4124'],
           [
               nav => [
                   [
                       ['Link', ['#'], active ],
                       ['Link', ['#'] ],
                       {
                           button => ['Dropdown', ['#'], caret],
                           items => [
                               ['Action', ['#'] ],
                               ['Another action', ['#'] ],
                               ['Something else here', ['#'] ],
                               [],
                               ['Separated link', ['#'] ],
                               [],
                               ['One more separated link', ['#'] ],
                           ],
                       },
                    ],
                ],
                form => [
                    [['/login'], method => 'post', left],
                    [
                        formgroup => [
                            undef,
                            text_field => ['the-search', placeholder => 'Search' ],
                        ],
                        submit_button => ['Submit'],
                    ]
                ],
                nav => [
                    right,
                    [
                        ['Link', ['#'] ],
                        {
                            button => ['Dropdown', ['#'], caret],
                            items => [
                                ['Action', ['#'] ],
                                ['Another action', ['#'] ],
                                ['Something else here', ['#'] ],
                                [],
                                ['Separated link', ['#'] ],
                            ],
                        }
                    ],
                ]
           ]

%>

