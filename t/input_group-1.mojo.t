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




#** test from input_group-1.mojo, line 15

my $expected_input_group_1_2 = qq{
    <div class="input-group input-group-lg">
        <span class="input-group-addon"><input name="yes" type="radio" /></span>
        <input class="form-control" id="username" type="text" name="username" />
        <span class="input-group-addon">@</span>
    </div>
};

get '/input_group_1_2' => 'input_group_1_2';

$test->get_ok('/input_group_1_2')->status_is(200)->trimmed_content_is($expected_input_group_1_2, 'Matched trimmed content in input_group-1.mojo, line 15');


#** test from input_group-1.mojo, line 33

my $expected_input_group_1_3 = qq{
    <div class="input-group">
        <input class="form-control" id="username" type="text" name="username" />
        <span class="input-group-btn"><button class="btn btn-default" type="button">Click me!</button></span>
    </div>
};

get '/input_group_1_3' => 'input_group_1_3';

$test->get_ok('/input_group_1_3')->status_is(200)->trimmed_content_is($expected_input_group_1_3, 'Matched trimmed content in input_group-1.mojo, line 33');

done_testing();

__DATA__

@@ input_group_1_2.html.ep


    <%= input large,
              prepend => { radio_button => ['yes'] },
              input => { text_field => ['username'] },
              append => '@'
    %>


@@ input_group_1_3.html.ep


    <%= input input => { text_field => ['username'] },
              append => { button => ['Click me!'] },
    %>

