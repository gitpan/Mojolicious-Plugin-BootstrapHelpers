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




#** test from panel-1.mojo, line 1

my $expected_panel_1_1 = qq{
    <div class="panel panel-default">
        <div class="panel-body">
        </div>
    </div>
};

get '/panel_1_1' => 'panel_1_1';

$test->get_ok('/panel_1_1')->status_is(200)->trimmed_content_is($expected_panel_1_1, 'Matched trimmed content in panel-1.mojo, line 1');


#** test from panel-1.mojo, line 14

my $expected_panel_1_2 = qq{
    <div class="panel panel-default">
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>
};

get '/panel_1_2' => 'panel_1_2';

$test->get_ok('/panel_1_2')->status_is(200)->trimmed_content_is($expected_panel_1_2, 'Matched trimmed content in panel-1.mojo, line 14');


#** test from panel-1.mojo, line 30

my $expected_panel_1_3 = qq{
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">The Header</h3>
        </div>
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>
};

get '/panel_1_3' => 'panel_1_3';

$test->get_ok('/panel_1_3')->status_is(200)->trimmed_content_is($expected_panel_1_3, 'Matched trimmed content in panel-1.mojo, line 30');


#** test from panel-1.mojo, line 48

my $expected_panel_1_4 = qq{
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Panel 5</h3>
        </div>
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>
};

get '/panel_1_4' => 'panel_1_4';

$test->get_ok('/panel_1_4')->status_is(200)->trimmed_content_is($expected_panel_1_4, 'Matched trimmed content in panel-1.mojo, line 48');


#** test from panel-1.mojo, line 70

my $expected_panel_1_5 = qq{
    <div class="panel panel-default">
        <div class="panel-body">
        </div>
    </div>
};

get '/panel_1_5' => 'panel_1_5';

$test->get_ok('/panel_1_5')->status_is(200)->trimmed_content_is($expected_panel_1_5, 'Matched trimmed content in panel-1.mojo, line 70');


#** test from panel-1.mojo, line 81

my $expected_panel_1_6 = qq{
    <div class="panel panel-default">
        <div class="panel-body">
            <p>In the panel.</p>
        </div>
    </div>
};

get '/panel_1_6' => 'panel_1_6';

$test->get_ok('/panel_1_6')->status_is(200)->trimmed_content_is($expected_panel_1_6, 'Matched trimmed content in panel-1.mojo, line 81');


#** test from panel-1.mojo, line 95

my $expected_panel_1_7 = qq{
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Test</h3>
        </div>
        <div class="panel-body">
        </div>
    </div>
};

get '/panel_1_7' => 'panel_1_7';

$test->get_ok('/panel_1_7')->status_is(200)->trimmed_content_is($expected_panel_1_7, 'Matched trimmed content in panel-1.mojo, line 95');


#** test from panel-1.mojo, line 109

my $expected_panel_1_8 = qq{
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">The Header</h3>
        </div>
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>
};

get '/panel_1_8' => 'panel_1_8';

$test->get_ok('/panel_1_8')->status_is(200)->trimmed_content_is($expected_panel_1_8, 'Matched trimmed content in panel-1.mojo, line 109');


#** test from panel-1.mojo, line 126

my $expected_panel_1_9 = qq{
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Panel 5</h3>
        </div>
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>
};

get '/panel_1_9' => 'panel_1_9';

$test->get_ok('/panel_1_9')->status_is(200)->trimmed_content_is($expected_panel_1_9, 'Matched trimmed content in panel-1.mojo, line 126');

done_testing();

__DATA__

@@ panel_1_1.html.ep


    %= panel


@@ panel_1_2.html.ep


    %= panel undef ,=> begin
        <p>A short text.</p>
    %  end


@@ panel_1_3.html.ep


    %= panel 'The Header' => begin
        <p>A short text.</p>
    %  end


@@ panel_1_4.html.ep


    %= panel 'Panel 5', success, begin
        <p>A short text.</p>
    %  end


@@ panel_1_5.html.ep


    %= panel


@@ panel_1_6.html.ep


    %= panel undef ,=> begin
        <p>In the panel.</p>
    %  end


@@ panel_1_7.html.ep


    %= panel 'Test'


@@ panel_1_8.html.ep


%= panel 'The Header' => begin
    <p>A short text.</p>
%  end


@@ panel_1_9.html.ep


    %= panel 'Panel 5', success, begin
        <p>A short text.</p>
    %  end

