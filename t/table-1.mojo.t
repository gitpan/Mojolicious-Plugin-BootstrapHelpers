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




#** test from table-1.mojo, line 1

my $expected_table_1_1 = qq{
    <table class="table">
        <tr><td>Table 1</td></tr>
    </table>
};

get '/table_1_1' => 'table_1_1';

$test->get_ok('/table_1_1')->status_is(200)->trimmed_content_is($expected_table_1_1, 'Matched trimmed content in table-1.mojo, line 1');


#** test from table-1.mojo, line 16

my $expected_table_1_2 = qq{
    <table class="table table-condensed table-hover table-striped">
        <tr><td>Table 2</td></tr>
    </table>
};

get '/table_1_2' => 'table_1_2';

$test->get_ok('/table_1_2')->status_is(200)->trimmed_content_is($expected_table_1_2, 'Matched trimmed content in table-1.mojo, line 16');


#** test from table-1.mojo, line 30

my $expected_table_1_3 = qq{
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Heading Table 4</h3>
        </div>
        <table class="table table-condensed" id="the-table">
            <tr><td>Table 4</td></tr>
        </table>
    </div>
};

get '/table_1_3' => 'table_1_3';

$test->get_ok('/table_1_3')->status_is(200)->trimmed_content_is($expected_table_1_3, 'Matched trimmed content in table-1.mojo, line 30');


#** test from table-1.mojo, line 51

my $expected_table_1_4 = qq{
    <table class="table">
        <tr><td>Table 1</td></tr>
    </table>
};

get '/table_1_4' => 'table_1_4';

$test->get_ok('/table_1_4')->status_is(200)->trimmed_content_is($expected_table_1_4, 'Matched trimmed content in table-1.mojo, line 51');


#** test from table-1.mojo, line 64

my $expected_table_1_5 = qq{
    <table class="table table-condensed table-hover table-striped">
        <thead>
            <tr><th>In the th</th></tr>
        </thead>
        <tbody>
            <tr><td>Table 2</td></tr>
        </tbody>
    </table>
};

get '/table_1_5' => 'table_1_5';

$test->get_ok('/table_1_5')->status_is(200)->trimmed_content_is($expected_table_1_5, 'Matched trimmed content in table-1.mojo, line 64');


#** test from table-1.mojo, line 86

my $expected_table_1_6 = qq{
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Heading Table 3</h3>
        </div>
        <table class="table table-condensed table-hover table-striped">
            <tr><td>Table 3</td></tr>
        </table>
    </div>
};

get '/table_1_6' => 'table_1_6';

$test->get_ok('/table_1_6')->status_is(200)->trimmed_content_is($expected_table_1_6, 'Matched trimmed content in table-1.mojo, line 86');

done_testing();

__DATA__

@@ table_1_1.html.ep


    <%= table begin %>
        <tr><td>Table 1</td></tr>
    <% end %>


@@ table_1_2.html.ep


    %= table hover, striped, condensed, begin
        <tr><td>Table 2</td></tr>
    %  end


@@ table_1_3.html.ep


    %= table 'Heading Table 4', panel => { success }, condensed, id => 'the-table', begin
        <tr><td>Table 4</td></tr>
    %  end


@@ table_1_4.html.ep


    <%= table begin %>
        <tr><td>Table 1</td></tr>
    <% end %>


@@ table_1_5.html.ep


    %= table hover, striped, condensed, begin
        <thead>
            <tr><th>In the th</th></tr>
        </thead>
        <tbody>
            <tr><td>Table 2</td></tr>
        </tbody>
    %  end


@@ table_1_6.html.ep


    %= table 'Heading Table 3', hover, striped, condensed, begin
        <tr><td>Table 3</td></tr>
    %  end

