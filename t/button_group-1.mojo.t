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

