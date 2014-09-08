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

my $expected_table_1_1 = qq{     <table class="table">
        <tr><td>Table 1</td></tr>
    </table> };

get '/table_1_1' => 'table_1_1';

$test->get_ok('/table_1_1')->status_is(200)->trimmed_content_is($expected_table_1_1, 'Matched trimmed content in table-1.mojo, line 1');

#** test from table-1.mojo, line 13

my $expected_table_1_2 = qq{     <table class="table table-condensed table-hover table-striped">
        <tr><td>Table 2</td></tr>
    </table> };

get '/table_1_2' => 'table_1_2';

$test->get_ok('/table_1_2')->status_is(200)->trimmed_content_is($expected_table_1_2, 'Matched trimmed content in table-1.mojo, line 13');

#** test from table-1.mojo, line 25

my $expected_table_1_3 = qq{     <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Heading Table 3</h3>
        </div>
        <table class="table table-condensed table-hover table-striped">
            <tr><td>Table 3</td></tr>
        </table>
    </div> };

get '/table_1_3' => 'table_1_3';

$test->get_ok('/table_1_3')->status_is(200)->trimmed_content_is($expected_table_1_3, 'Matched trimmed content in table-1.mojo, line 25');

#** test from table-1.mojo, line 42

my $expected_table_1_4 = qq{     <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Heading Table 4</h3>
        </div>
        <table class="table table-condensed" id="the-table">
            <tr><td>Table 4</td></tr>
        </table>
    </div> };

get '/table_1_4' => 'table_1_4';

$test->get_ok('/table_1_4')->status_is(200)->trimmed_content_is($expected_table_1_4, 'Matched trimmed content in table-1.mojo, line 42');

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

    %= table 'Heading Table 3', hover, striped, condensed, begin
        <tr><td>Table 3</td></tr>
    %  end

@@ table_1_4.html.ep

    %= table 'Heading Table 4', panel => { success }, condensed, id => 'the-table', begin
        <tr><td>Table 4</td></tr>
    %  end
