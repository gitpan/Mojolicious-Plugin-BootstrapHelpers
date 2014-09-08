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



#** test from icon-1.mojo, line 1

my $expected_icon_1_1 = qq{ 	<span class="glyphicon glyphicon-copyright-mark"></span> };

get '/icon_1_1' => 'icon_1_1';

$test->get_ok('/icon_1_1')->status_is(200)->trimmed_content_is($expected_icon_1_1, 'Matched trimmed content in icon-1.mojo, line 1');

#** test from icon-1.mojo, line 10

my $expected_icon_1_2 = qq{ 	<span class="glyphicon glyphicon-sort-by-attributes-alt"></span> };

get '/icon_1_2' => 'icon_1_2';

$test->get_ok('/icon_1_2')->status_is(200)->trimmed_content_is($expected_icon_1_2, 'Matched trimmed content in icon-1.mojo, line 10');

done_testing();

__DATA__

@@ icon_1_1.html.ep

	<%= icon 'copyright-mark' %>

@@ icon_1_2.html.ep

	%= icon 'sort-by-attributes-alt'
