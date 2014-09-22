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


#** test from navbar-1.mojo, line 95

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

$test->get_ok('/navbar_1_4')->status_is(200)->trimmed_content_is($expected_navbar_1_4, 'Matched trimmed content in navbar-1.mojo, line 95');

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

