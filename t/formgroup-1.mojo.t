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




#** test from formgroup-1.mojo, line 1

my $expected_formgroup_1_1 = qq{
    <div class="form-group">
        <label class="control-label" for="test_text">Text test 1</label>
        <input class="form-control" id="test_text" name="test_text" type="text" />
    </div>
};

get '/formgroup_1_1' => 'formgroup_1_1';

$test->get_ok('/formgroup_1_1')->status_is(200)->trimmed_content_is($expected_formgroup_1_1, 'Matched trimmed content in formgroup-1.mojo, line 1');


#** test from formgroup-1.mojo, line 14

my $expected_formgroup_1_2 = qq{
    <div class="form-group">
        <label class="control-label" for="test_text">Text test 2</label>
        <input class="form-control" id="test_text" name="test_text" size="30" type="text" />
    </div>
};

get '/formgroup_1_2' => 'formgroup_1_2';

$test->get_ok('/formgroup_1_2')->status_is(200)->trimmed_content_is($expected_formgroup_1_2, 'Matched trimmed content in formgroup-1.mojo, line 14');


#** test from formgroup-1.mojo, line 26

my $expected_formgroup_1_3 = qq{
    <div class="form-group">
        <label class="control-label" for="test-text">Text test 4</label>
        <input class="form-control input-lg" id="test-text" name="test_text" type="text" />
    </div>
};

get '/formgroup_1_3' => 'formgroup_1_3';

$test->get_ok('/formgroup_1_3')->status_is(200)->trimmed_content_is($expected_formgroup_1_3, 'Matched trimmed content in formgroup-1.mojo, line 26');


#** test from formgroup-1.mojo, line 42

my $expected_formgroup_1_4 = qq{
    <div class="form-group">
        <label class="control-label" for="test_text">Text test 5</label>
        <input class="form-control" id="test_text" name="test_text" type="text" value="200" />
    </div>
};

get '/formgroup_1_4' => 'formgroup_1_4';

$test->get_ok('/formgroup_1_4')->status_is(200)->trimmed_content_is($expected_formgroup_1_4, 'Matched trimmed content in formgroup-1.mojo, line 42');


#** test from formgroup-1.mojo, line 54

my $expected_formgroup_1_5 = qq{
    <form class="form-horizontal">
        <div class="form-group form-group-lg">
            <label class="control-label col-sm-2" for="test_text">Text test 6</label>
            <div class="col-sm-10">
                <input class="form-control" id="test_text" name="test_text" type="text">
            </div>
        </div>
    </form>
};

get '/formgroup_1_5' => 'formgroup_1_5';

$test->get_ok('/formgroup_1_5')->status_is(200)->trimmed_content_is($expected_formgroup_1_5, 'Matched trimmed content in formgroup-1.mojo, line 54');


#** test from formgroup-1.mojo, line 74

my $expected_formgroup_1_6 = qq{
    <div class="form-group">
        <label class="control-label" for="test_text"> Text test 7 </label>
        <input class="form-control input-xs" id="test_text" name="test_text" type="text" />
    </div>
};

get '/formgroup_1_6' => 'formgroup_1_6';

$test->get_ok('/formgroup_1_6')->status_is(200)->trimmed_content_is($expected_formgroup_1_6, 'Matched trimmed content in formgroup-1.mojo, line 74');


#** test from formgroup-1.mojo, line 89

my $expected_formgroup_1_7 = qq{
    <div class="form-group">
        <label class="control-label col-md-2 col-sm-4" for="test_text">Text test 8</label>
        <div class="col-md-10 col-sm-8">
            <input class="form-control" id="test_text" name="test_text" type="text" />
        </div>
    </div>
};

get '/formgroup_1_7' => 'formgroup_1_7';

$test->get_ok('/formgroup_1_7')->status_is(200)->trimmed_content_is($expected_formgroup_1_7, 'Matched trimmed content in formgroup-1.mojo, line 89');


#** test from formgroup-1.mojo, line 106

my $expected_formgroup_1_8 = qq{
    <div class="form-group">
        <input class="form-control" id="test-text-9" name="test_text_9" type="text" />
    </div>
};

get '/formgroup_1_8' => 'formgroup_1_8';

$test->get_ok('/formgroup_1_8')->status_is(200)->trimmed_content_is($expected_formgroup_1_8, 'Matched trimmed content in formgroup-1.mojo, line 106');

done_testing();

__DATA__

@@ formgroup_1_1.html.ep


    %= formgroup 'Text test 1', text_field => ['test_text']


@@ formgroup_1_2.html.ep


    %= formgroup 'Text test 2', text_field => ['test_text', size => 30]


@@ formgroup_1_3.html.ep


    %= formgroup 'Text test 4', text_field => ['test-text', large]


@@ formgroup_1_4.html.ep


    %= formgroup 'Text test 5', text_field => ['test_text', '200' ]


@@ formgroup_1_5.html.ep


    <form class="form-horizontal">
        %= formgroup 'Text test 6', text_field => ['test_text'], large, cols => { small => [2, 10] }
    </form>


@@ formgroup_1_6.html.ep


    %= formgroup text_field => ['test_text', xsmall] => begin
        Text test 7
    %  end


@@ formgroup_1_7.html.ep


    %= formgroup 'Text test 8', text_field => ['test_text'], cols => { medium => [2, 10], small => [4, 8] }


@@ formgroup_1_8.html.ep


    %= formgroup text_field => ['test-text-9']

