package Mojolicious::Plugin::BootstrapHelpers 0.0175 {

    use strict;
    use warnings;
    use true;

    use Mojo::Base 'Mojolicious::Plugin';

    use List::AllUtils qw/uniq first_index/;
    use Mojo::ByteStream;
    use Mojo::Util 'xml_escape';
    use Scalar::Util 'blessed';
    use String::Trim;
    use Mojolicious::Plugin::BootstrapHelpers::Helpers;

    use experimental 'postderef'; # requires 5.20

    sub register {
        my $self = shift;
        my $app = shift;
        my $args = shift;

        my $tp = setup_prefix($args->{'tag_prefix'});
        my $ssp = setup_prefix($args->{'short_strappings_prefix'});
        my $init_short_strappings = $args->{'init_short_strappings'} //= 1;

        $app->helper($tp.'bootstrap' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstraps_bootstraps);
        $app->helper($tp.'table' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_table);
        $app->helper($tp.'panel' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_panel);
        $app->helper($tp.'formgroup' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_formgroup);
        $app->helper($tp.'button' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_button);
        $app->helper($tp.'submit_button' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_submit);
        $app->helper($tp.'badge' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_badge);
        $app->helper($tp.'dropdown' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_dropdown);
        $app->helper($tp.'buttongroup' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_buttongroup);
        $app->helper($tp.'toolbar' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_toolbar);
        $app->helper($tp.'input' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_input);
        $app->helper($tp.'navbar' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_navbar);
        $app->helper($tp.'nav' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_nav);

        if(exists $args->{'icons'}{'class'} && $args->{'icons'}{'formatter'}) {
            $app->config->{'Plugin::BootstrapHelpers'} = $args;
            $app->helper($tp.'icon' => \&Mojolicious::Plugin::BootstrapHelpers::Helpers::bootstrap_icon);
        }

        if($init_short_strappings) {
            my @sizes = qw/xsmall small medium large/;
            my @contexts = qw/default active primary success info warning danger/;
            my @table = qw/striped bordered hover condensed responsive/;
            my @direction = qw/right left block vertical justified dropup/;
            my @menu = qw/caret hamburger/;
            my @misc = qw/disabled inverse/;

            foreach my $helper (@sizes, @contexts, @table, @direction, @menu, @misc) {
               $app->helper($ssp.$helper, sub { ("__$helper" => 1) });
            }
        }
    }

    sub setup_prefix {
        my $prefix = shift;

        return defined $prefix && !length $prefix   ?   '_'
             : defined $prefix                      ?   $prefix
             :                                          ''
             ;
    }

}
__END__

=encoding utf-8

=head1 NAME

Mojolicious::Plugin::BootstrapHelpers - Type less bootstrap

=for html <p><a style="float: left;" href="https://travis-ci.org/Csson/p5-mojolicious-plugin-bootstraphelpers"><img src="https://travis-ci.org/Csson/p5-mojolicious-plugin-bootstraphelpers.svg?branch=master">&nbsp;</a>

=head1 SYNOPSIS

    # Mojolicious
    $self->plugin('BootstrapHelpers');

    # ::Lite
    plugin 'BootstrapHelpers';

    # Meanwhile, somewhere in a template...
    %= formgroup 'Email', text_field => ['email'], large, cols => { small => [3, 9] }

    # ...that renders into
    <div class="form-group form-group-lg">
        <label class="control-label col-sm-3" for="email">Email</label>
        <div class="col-sm-9">
            <input class="form-control" id="email" name="email" type="text">
        </div>
    </div>

=head1 STATUS

This is an unstable work in progress. Backwards compatibility is currently not to be expected between releases.

Currently supported Bootstrap version: 3.2.0.

Currently only Perl 5.20+ is supported (thanks to postderef).

=head1 DESCRIPTION

Mojolicious::Plugin::BootstrapHelpers is a convenience plugin that reduces some bootstrap complexity by introducing several tag helpers specifically for L<Bootstrap 3|http://www.getbootstrap.com/>.

The goal is not to have tag helpers for everything, but for common use cases.

All examples below (and more, see tests) is expected to work.


=head2 How to use Bootstrap

If you don't know what Bootstrap is, see L<http://www.getbootstrap.com/> for possible usages.

You might want to use L<Mojolicious::Plugin::Bootstrap3> in your templates.

To get going quickly by using the official CDN you can use the following helpers:

    # CSS
    %= bootstrap

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    # or (if you want to use the theme)
    %= bootstrap 'theme'

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    # And the javascript
    %= bootstrap 'js'

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    # Or just:
    %= bootstrap 'all'

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

It is also possible to automatically include jQuery (2.*)

    %= bootstrap 'jsq'

    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    %= bootstrap 'allq'

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


=head2 Strappings

There are several shortcuts ("strappings") for applying context and size classes that automatically expands to the correct class depending
on which tag it is applied to. For instance, if you apply the C<info> strapping to a panel, it becomes C<panel-info>, but when applied to a button it becomes C<btn-info>.

You can use them in two different ways, but internally they are the same. These to lines are exactly identical:

    %= button 'Push me', primary

    %= button 'Push me', __primary => 1



For sizes, you can only use the longform (C<xsmall>, C<small>, C<medium> and C<large>) no matter if you use the short strapping form or not.
They are shortened to the Bootstrap type classes.

The following strappings are available:

   xsmall    default     striped       caret     right
   small     primary     bordered
   medium    success     hover
   large     info        condensed
             warning     responsive
             danger

Add two leading underscores if you don't want to use the short form.

See below for usage. B<Important:> You can't follow a short form strapping with a fat comma (C<=E<gt>>). The fat comma auto-quotes the strapping, and then it breaks.

If there is no corresponding class for the element you add the strapping to it is silently not applied.

=begin html

<p>The short form is recommended for readability, but it does setup several helpers in your templates.
You can turn off the short forms, see <a href="#init_short_strappings">init_short_strappings</a>.</p>

=end html

=head2 Syntax convention

In the syntax sections below the following conventions are used:

    name            A specific string
    $name           Any string
    %name           One or more key-value pairs, written as:
                      key => 'value', key2 => 'value2'
                         or, if you use short form strappings:
                      primary, large
    $key => [...]   Both of these are array references where the ordering of strings
    key  => [...]     are significant, for example:
                      key => [ $thing, $thing2, %hash ]
    $key => {...}   Both of these are hash references where the ordering of pairs are
    key  => {...}     are insignificant, for example:
                      key => { key2 => $value, key3 => 'othervalue' }
    (...)           Anything between parenthesis is optional. The parenthesis is not part of the
                      actual syntax
    |...|           Two pipes is a reference to another specification. For instance, button toolbars contain
                      button groups that contain buttons. Using this syntax makes the important parts clearer.
                      The pipes are not part of the actual syntax.


Ordering between two hashes that follows each other is also not significant.

B<About C<%has>>

The following applies to all C<%has> hashes below:

=over 4

=item * They refer to any html attributes and/or strappings to apply to the current element.

=item * When helpers are nested, all occurrencies are change to tag-specific names, such as C<%panel_has>.

=item * This hash is always optional. It is not marked so in the definitions below in order to reduce clutter.

=item * Depending on context either the leading or following comma is optional together with the hash. It is usually obvious.

=item * Sometimes on nested helpers (such as tables in panels just below), C<%has> is the only thing that can be applied to
        the other element. In this case C<panel =E<gt> { %panel_has }>. It follows from above that in those cases this entire
        expression is I<also> optional. Such cases are also not marked as optional in syntax definitions and are not mentioned
        in syntax description, unless they need further comment.

=back

From this definition:

    %= table ($title,) %table_has, panel => { %panel_has }, begin
           $body
    %  end

Both of these are legal:

    # since both panel => { %panel_has } and %table_has are hashes, their ordering is not significant.
    %= table 'Heading Table', panel => { success }, condensed, id => 'the-table', begin
         <tr><td>A Table Cell</td></tr>
    %  end


    %= table begin
         <tr><td>A Table Cell</td></tr>
    %  end


=head1 HELPERS

L<Bootstrap documentation|http://getbootstrap.com/components/#badges>

=head2 Badges

=head3 Syntax

    %= badge $text, %has

B<C<$text>>

Mandatory. If it is C<undef> no output is produced.


B<Available strappings>

C<right> applies C<.pull-right>.


=head3 Examples


    <%= badge '3' %>

    <span class="badge">3</span></a>

=begin html

<p>
A basic badge.

</p>

=end html


    <%= badge '4', data => { custom => 'yes' }, right %>

    <span class="badge pull-right" data-custom="yes">4</span>

=begin html

<p>
A right aligned badge with a data attribute.

</p>

=end html




=head2 Buttons

L<Bootstrap documentation|http://getbootstrap.com/css/#buttons>

=head3 Syntax

    %= button $button_text(, [$url]), %has

    %= submit_button $text, %has

B<C<$button_text>>

Mandatory. The text on the button.

B<C<[$url]>>

Optional array reference. It is handed off to L<url_for|Mojolicious::Controller#url_for>, so with it this is
basically L<link_to|Mojolicious::Plugin::TagHelpers#link_to> with Bootstrap classes.

Not available for C<submit_button>.


B<Available strappings>

C<default> C<primary> C<success> C<info> C<warning> C<danger> C<link> applies the various C<.btn-*> classes.

C<large> C<small> C<xsmall> applies C<.btn-lg> C<.btn-sm> C<.btn-xs> respectively.

C<active> C<block> applies the C<.active> and C<.block> classes.

C<disabled> applies the C<.disabled> class if the generated element is an C<E<lt>aE<gt>>. On a C<E<lt>buttonE<gt>> it applies the C<disabled="disabled"> attribute.


=head3 Examples


    %= button 'The example 5' => large, warning

    <button class="btn btn-lg btn-warning" type="button">The example 5</button>

=begin html

<p>
An ordinary button, with applied strappings.

</p>

=end html


    %= button 'The example 1' => ['http://www.example.com/'], small

    <a class="btn btn-default btn-sm" href="http://www.example.com/">The example 1</a>

=begin html

<p>
With a url the button turns into a link.

</p>

=end html


    %= submit_button 'Save 2', primary

    <button class="btn btn-primary" type="submit">Save 2</button>

=begin html

<p>
A submit button for use in forms. It overrides the build-in submit_button helper.

</p>

=end html





=head2 Button groups

=head3 Syntax

There are two different syntaxes. One for single-button dropdowns and one for multi-button dropdowns.

    # multi button
    <%= buttongroup %has,
                    buttons => [
                        [ |button| ],
                        {
                            button => [ |button| ],
                            items => [
                                [ $itemtext, [ $url ], %item_has ],
                               ($headertext,)
                               ([],)
                            ]
                        }
                    ]
    %>

    # single button
    <%= buttongroup {
                        button => [ |button| ],
                        items => [
                            [ $itemtext, [ $url ], %item_has ],
                           ($headertext,)
                           ([],)
                        ]
                    }
    %>

B<C<buttons =E<gt> []>>

Single-button: Not available. Multi-button: Mandatory array reference. Takes a list of child elements of two different types:

=over 4

B<C<[ |button| ]>>

Single-button: Not available. Multi-button: Array references are (and take the same arguments as) ordinary L<buttons|/"Buttons">. Two exceptions: It can't take a url, and it can take the C<caret> strapping.

B<C<{ ... }>>

Hash references are nested L<dropdowns|/"Dropdowns">. Read more there.

For the single-button dropdown, this is the only argument.

=back

=head3 Examples


    <%= buttongroup
        buttons => [
            ['Button 1'],
            ['Button 2'],
            ['Button 3'],
        ]
    %>

    <div class="btn-group">
        <button class="btn btn-default" type="button">Button 1</button>
        <button class="btn btn-default" type="button">Button 2</button>
        <button class="btn btn-default" type="button">Button 3</button>
    </div>

=begin html

<p>
A basic button group.

</p>

=end html


    <%= buttongroup small,
        buttons => [
            ['Button 1'],
            { button => ['Dropdown 1', caret],
              items => [
                  ['Item 1', ['item1'] ],
                  ['Item 2', ['item2'] ],
                  [],
                  ['Item 3', ['item3'] ],
              ],
            },
            ['Button 2'],
            ['Button 3'],
        ],
    %>

    <div class="btn-group btn-group-sm">
        <button class="btn btn-default" type="button">Button 1</button>
        <div class="btn-group btn-group-sm">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Dropdown 1 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
        <button class="btn btn-default" type="button">Button 2</button>
        <button class="btn btn-default" type="button">Button 3</button>
    </div>

=begin html

<p>
Nested button group. Note that the <code>small</code> strapping is only necessary once. The same classes are automatically applied to the nested <code>.btn-group</code>.

</p>

=end html


    <%= buttongroup vertical,
        buttons => [
            ['Button 1'],
            { button => ['Dropdown 1', caret],
              items => [
                  ['Item 1', ['item1'] ],
                  ['Item 2', ['item2'] ],
                  [],
                  ['Item 3', ['item3'] ],
              ],
            },
            ['Button 2'],
            ['Button 3'],
        ],
    %>

    <div class="btn-group-vertical">
        <button class="btn btn-default" type="button">Button 1</button>
        <div class="btn-group">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Dropdown 1 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
        <button class="btn btn-default" type="button">Button 2</button>
        <button class="btn btn-default" type="button">Button 3</button>
    </div>

=begin html

<p>
Nested button group, with the <code>vertical</code> strapping.

</p>

=end html


    <%= buttongroup justified,
        buttons => [
            ['Link 1', ['http://www.example.com/'] ],
            ['Link 2', ['http://www.example.com/'] ],
            { dropup,
              button => ['Dropup 1', caret],
              items => [
                  ['Item 1', ['item1'] ],
                  ['Item 2', ['item2'] ],
                  [],
                  ['Item 3', ['item3'] ],
              ],
            },
        ]
    %>

    <div class="btn-group btn-group-justified">
        <a class="btn btn-default" href="http://www.example.com/">Link 1</a>
        <a class="btn btn-default" href="http://www.example.com/">Link 2</a>
        <div class="btn-group dropup">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Dropup 1 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
    </div>

=begin html

<p>
Mix links and <code>dropup</code> menus in <code>justified</code> button groups.

</p>

=end html


    <%= buttongroup
        buttons => [
            ['Link 1', ['http://www.example.com/'] ],
            { button => [undef, caret],
              items => [
                  ['Item 1', ['item1'] ],
                  ['Item 2', ['item2'] ],
                  [],
                  ['Item 3', ['item3'] ],
              ],
            },
        ]
    %>

    <div class="btn-group">
        <a class="btn btn-default" href="http://www.example.com/">Link 1</a>
        <div class="btn-group">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
    </div>

=begin html

<p>
Split button dropdowns uses the same syntax as any other multi-button dropdown. Set the <code>caret</code> button title to <code>undef</code>.

</p>

=end html


    <%= buttongroup { button => ['Default', caret],
                      items  => [
                          ['Item 1', ['item1'] ],
                          ['Item 2', ['item2'] ],
                          [],
                          ['Item 3', ['item3'] ],
                      ],
                    }
    %>

    <%= buttongroup { button => ['Big danger', caret, large, danger],
                      items  => [
                          ['Item 1', ['item1'] ],
                          ['Item 2', ['item2'] ],
                          [],
                          ['Item 3', ['item3'] ],
                      ],
                    }
    %>

    <div class="btn-group">
        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Default <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
            <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
        </ul>
    </div>

    <div class="btn-group">
        <button class="btn btn-danger btn-lg dropdown-toggle" type="button" data-toggle="dropdown">Big danger <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
            <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
        </ul>
    </div>

=begin html

<p>
Using the shortcut to create single-button button group dropdowns.
</p>

=end html





=head2 Button toolbars

=head3 Syntax

    <%= toolbar %toolbar_has,
                groups => [
                    { |button_group| }
                ]
    %>

B<C<groups =E<gt> [ { |button_group| } ]>>

A mandatory array reference of L<button groups|/"Button-groups">.

=head3 Examples


    <%= toolbar id => 'my-toolbar',
                groups => [
                    { buttons => [
                        ['Button 1'],
                        ['Button 2'],
                        ['Button 3'],
                      ],
                    },
                    { buttons => [
                        ['Button 4', primary],
                        ['Button 5'],
                        ['Button 6'],
                      ],
                    },
                ]
    %>

    <div class="btn-toolbar" id="my-toolbar">
        <div class="btn-group">
            <button class="btn btn-default" type="button">Button 1</button>
            <button class="btn btn-default" type="button">Button 2</button>
            <button class="btn btn-default" type="button">Button 3</button>
        </div>
        <div class="btn-group">
            <button class="btn btn-primary" type="button">Button 4</button>
            <button class="btn btn-default" type="button">Button 5</button>
            <button class="btn btn-default" type="button">Button 6</button>
        </div>
    </div>




=head2 Dropdowns

=head3 Syntax

    <%= dropdown  %has,
                  button => [ |button| ],
                  items  => [
                      [ $itemtext, [ $url ], %item_has ],
                     ($headertext,)
                     ([],)
                  ]

B<C<button =E<gt> []>>

Mandatory array reference. Takes the same arguments as an ordinary L<button|/"Buttons">, with two exceptions: It can't take a url, and it can take the C<caret> strapping.

B<C<items>>

Mandatory array reference. Here are the items that make up the menu. It takes two different types of value (both can occur any number of times:

=over 4

B<C<[ $itemtext, [ $url ], %item_has ]>>

This creates a linked menu item.

=over 4

B<C<$itemtext>>

Mandatory. The text on the link.

B<C<$url>>

Mandatory. It sets the C<href> on the link. L<url_for|Mojolicious::Controller#url_for> is used to create the link.

=back


B<C<$headertext>>

A string creates a dropdown header.

B<C<[]>>

An empty array reference creates a divider.

=back


B<Available strappings>

C<caret> adds a C<E<lt>span class="caret"E<gt>E<lt>/span<E<gt>> element on the button.


=head3 Examples


    <%= dropdown
         button => ['Dropdown 1', id => 'a_custom_id'],
         right,
         items => [
            ['Item 1', ['item1'] ],
            ['Item 2', ['item2'] ],
            [],
            ['Item 3', ['item3'] ]
         ] %>

    <div class="dropdown">
        <button class="btn btn-default dropdown-toggle" type="button" id="a_custom_id" data-toggle="dropdown">Dropdown 1</button>
        <ul class="dropdown-menu dropdown-menu-right">
            <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
            <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
        </ul>
    </div>

=begin html

<p>
By default, <code>tabindex</code> is set to <code>-1</code>...

</p>

=end html


    <%= dropdown
         button => ['Dropdown 2', caret, large, primary],
         items => [
            ['Item 1', ['item1'], data => { attr => 2 } ],
            ['Item 2', ['item2'], disabled, data => { attr => 4 } ],
            [],
            ['Item 3', ['item3'], data => { attr => 7 } ],
            [],
            ['Item 4', ['item4'], tabindex => 4 ],
            'This is a header',
            ['Item 5', ['item5'] ],
         ] %>

    <div class="dropdown">
        <button class="btn btn-lg btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown 2 <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><a class="menuitem" href="item1" tabindex="-1" data-attr="2">Item 1</a></li>
            <li class="disabled"><a class="menuitem" href="item2" tabindex="-1" data-attr="4">Item 2</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item3" tabindex="-1" data-attr="7">Item 3</a></li>
            <li class="divider"></li>
            <li><a class="menuitem" href="item4" tabindex="4">Item 4</a></li>
            <li class="dropdown-header">This is a header</li>
            <li><a class="menuitem" href="item5" tabindex="-1">Item 5</a></li>
        </ul>
    </div>

=begin html

<p>
...but it can be overridden.
</p>

=end html




=head2 Form groups

L<Bootstrap documentation|http://getbootstrap.com/css/#forms>

=head3 Syntax

    <%= formgroup ($labeltext,)
                   %formgroup_has,
                  (cols => { $size => [ $label_columns, $input_columns ], (...) })
                   $fieldtype => [
                       $input_name,
                      ($input_value,)
                       %input_has,
                  ]

    %>

    # The $labeltext can also be given in the body
    %= formgroup <as above>, begin
        $labeltext
    %  end

B<C<$labeltext>>

Optional. It is either the first argument, or placed in the body. It creates a C<label> element before the C<input>.

B<C<cols>>

Optional. It is only used when the C<form> is a C<.form-horizontal>. You can defined the widths for one or more or all of the sizes. See examples.

=over 4

B<C<$size>>

Mandatory. It is one of C<xsmall>, C<small>, C<medium> or C<large>. C<$size> takes a two item array reference.

=over 4

B<C<$label_columns>>

Mandatory. The number of columns that should be used by the label for that size of screen. Applies C<.col-$size-$label_columns> on the label.

B<C<$input_columns>>

Mandatory. The number of columns that should be used by the input for that size of screen. Applies C<.col-$size-$input_columns> around the input.

=back

=back

B<C<$fieldtype>>

Mandatory. Is one of C<text_field>, C<password_field>, C<datetime_field>, C<date_field>, C<month_field>, C<time_field>, C<week_field>,
C<number_field>, C<email_field>, C<url_field>, C<search_field>, C<tel_field>, C<color_field>.

There can be only one C<$fieldtype> per C<formgroup>.

=over 4

B<C<$name>>

Mandatory. It sets both the C<id> and C<name> of the input field. If the C<$name> contains dashes then those are translated
into underscores when setting the C<name>. If C<id> exists in C<%input_has> then that is used for the C<id> instead.

B<C<$input_value>>

Optional. If you prefer you can set C<value> in C<%input_has> instead. (But don't do both for the same field.)

=back


=head3 Examples


    %= formgroup 'Text test 1', text_field => ['test_text']

    <div class="form-group">
        <label class="control-label" for="test_text">Text test 1</label>
        <input class="form-control" id="test_text" name="test_text" type="text" />
    </div>

=begin html

<p>
The first item in the array ref is used for both <code>id</code> and <code>name</code>. Except...

</p>

=end html


    %= formgroup 'Text test 4', text_field => ['test-text', large]

    <div class="form-group">
        <label class="control-label" for="test-text">Text test 4</label>
        <input class="form-control input-lg" id="test-text" name="test_text" type="text" />
    </div>

=begin html

<p>
...if the input name (the first item in the text_field array ref) contains dashes -- those are replaced (in the <code>name</code>) to underscores.

</p>

=end html


    %= formgroup 'Text test 5', text_field => ['test_text', '200' ]

    <div class="form-group">
        <label class="control-label" for="test_text">Text test 5</label>
        <input class="form-control" id="test_text" name="test_text" type="text" value="200" />
    </div>

=begin html

<p>
An input with a value.

</p>

=end html


    <form class="form-horizontal">
        %= formgroup 'Text test 6', text_field => ['test_text'], large, cols => { small => [2, 10] }
    </form>

    <form class="form-horizontal">
        <div class="form-group form-group-lg">
            <label class="control-label col-sm-2" for="test_text">Text test 6</label>
            <div class="col-sm-10">
                <input class="form-control" id="test_text" name="test_text" type="text">
            </div>
        </div>
    </form>

=begin html

<p>
Note the difference with the earlier example. Here <code>large</code> is outside the <code>text_field</code> array reference, and therefore <code>.form-group-lg</code> is applied to the form group.

</p>

=end html


    %= formgroup 'Text test 8', text_field => ['test_text'], cols => { medium => [2, 10], small => [4, 8] }

    <div class="form-group">
        <label class="control-label col-md-2 col-sm-4" for="test_text">Text test 8</label>
        <div class="col-md-10 col-sm-8">
            <input class="form-control" id="test_text" name="test_text" type="text" />
        </div>
    </div>

=begin html

<p>
A formgroup used in a <code>.form-horizontal</code> <code>form</code>.

(Note that in this context, <code>medium</code> and <code>large</code> are not short form strappings. Those don't take arguments.)

</p>

=end html




=head2 Icons

This helper needs to be activated separately, see options below.

=head3 Syntax

    %= icon $icon_name

B<C<$icon_name>>

Mandatory. The specific icon you wish to create. Possible values depends on your icon pack.

=head3 Examples


    <%= icon 'copyright-mark' %>
    %= icon 'sort-by-attributes-alt'

    <span class="glyphicon glyphicon-copyright-mark"></span>
    <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>





=head2 Input groups

=head3 Syntax

    <%= input %has,
              (prepend => ...,)
              input => { |input_field| },
              (append => ...)
    %>

B<C<input =E<gt> { }>>

Mandatory hash reference. The content is handed off to L<input_tag|Mojolicious::Plugin::TagHelpers/"input_tag"> in L<Mojolicious::Plugin::TagHelpers>.

B<C<prepend> and C<append>>

Both are optional, but input groups don't make sense if neither is present. They take the same arguments, but there are a few to choose from:

=over 4

B<C<prepend =E<gt> $string>>

B<C<prepend =E<gt> { check_box =E<gt> [ |check_box| ] }>>

Creates a checkbox by giving its content to L<check_box|Mojolicious::Plugin::TagHelpers/"check_box"> in L<Mojolicious::Plugin::TagHelpers>.

B<C<prepend =E<gt> { radio_button =E<gt> [ |radio_button| ] }>>

Creates a radiobutton by giving its content to L<radio_button|Mojolicious::Plugin::TagHelpers/"radio_button"> in L<Mojolicious::Plugin::TagHelpers>.

B<C<prepend =E<gt> { buttongroup =E<gt> { |buttongroup| }>>

Creates a single button buttongroup. See L<button_groups|/"Button-groups"> for details.

B<C<prepend =E<gt> { buttongroup =E<gt> [ |buttongroup| ]>>

Creates a multi button buttongroup. See L<button_groups|/"Button-groups"> for details.

=back

=head3 Examples


    <%= input input => { text_field => ['username'] },
              prepend => { check_box => ['agreed'] }
    %>

    <div class="input-group">
        <span class="input-group-addon"><input name="agreed" type="checkbox" /></span>
        <input class="form-control" id="username" type="text" name="username" />
    </div>

=begin html

<p>
An input group with a checkbox.

</p>

=end html


    <%= input large,
              prepend => { radio_button => ['yes'] },
              input => { text_field => ['username'] },
              append => '@'
    %>

    <div class="input-group input-group-lg">
        <span class="input-group-addon"><input name="yes" type="radio" /></span>
        <input class="form-control" id="username" type="text" name="username" />
        <span class="input-group-addon">@</span>
    </div>

=begin html

<p>
A <code>large</code> input group with a radio button prepended and a string appended.

</p>

=end html


    <%= input input => { text_field => ['username'] },
              append => { button => ['Click me!'] },
    %>

    <div class="input-group">
        <input class="form-control" id="username" type="text" name="username" />
        <span class="input-group-btn"><button class="btn btn-default" type="button">Click me!</button></span>
    </div>

=begin html

<p>
An input group with a button.

</p>

=end html


    <%= input input  => { text_field => ['username'] },
              append => { buttongroup => {
                              right,
                              button => ['The button', caret],
                              items  => [
                                  ['Item 1', ['item1'] ],
                                  ['Item 2', ['item2'] ],
                                  [],
                                  ['Item 3', ['item3'] ],
                              ],
                          }
                        }
    %>

    <div class="input-group">
        <input class="form-control" id="username" type="text" name="username" />
        <div class="input-group-btn">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">The button <span class="caret"></span>
            </button>
            <ul class="dropdown-menu dropdown-menu-right">
                <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                <li class="divider"></li>
                <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
            </ul>
        </div>
    </div>

=begin html

<p>
An input group with a button dropdown appended. Note that <code>right</code> is manually applied.

</p>

=end html


    <%= input input   => { text_field => ['username'] },
              prepend => { buttongroup => [
                              buttons => [
                                ['Link 1', ['http://www.example.com/'] ],
                                { button => [undef, caret],
                                  items => [
                                      ['Item 1', ['item1'] ],
                                      ['Item 2', ['item2'] ],
                                      [],
                                      ['Item 3', ['item3'] ],
                                  ],
                               },
                            ],
                         ],
                      },
    %>

    <div class="input-group">
        <div class="input-group-btn">
            <a class="btn btn-default" href="http://www.example.com/">Link 1</a>
            <div class="btn-group">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="menuitem" href="item1" tabindex="-1">Item 1</a></li>
                    <li><a class="menuitem" href="item2" tabindex="-1">Item 2</a></li>
                    <li class="divider"></li>
                    <li><a class="menuitem" href="item3" tabindex="-1">Item 3</a></li>
                </ul>
            </div>
        </div>
        <input class="form-control" id="username" type="text" name="username" />
    </div>

=begin html

<p>
An input group with a split button dropdown prepended.
</p>

=end html




=head2 Panels

L<Bootstrap documentation|http://getbootstrap.com/components/#panels>

=head3 Syntax

    %= panel ($title, %has, begin
        $body
    %  end)

B<C<$title>>

Usually mandatory, but can be omitted if there are no other arguments to the C<panel>. Otherwise, if you don't want a title, set it C<undef>.

B<C<$body>>

Optional (but panels are not much use without it). The html inside the C<panel>.


=head3 Examples


    %= panel

    <div class="panel panel-default">
        <div class="panel-body">
        </div>
    </div>

=begin html

<p>
The class is set to <code>.panel-default</code>, by default.

</p>

=end html


    %= panel undef ,=> begin
        <p>A short text.</p>
    %  end

    <div class="panel panel-default">
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>

=begin html

<p>
If you want a panel without title, set the title to <code>undef</code>.

</p>

=end html


    %= panel 'The Header' => begin
        <p>A short text.</p>
    %  end

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">The Header</h3>
        </div>
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>


    %= panel 'Panel 5', success, begin
        <p>A short text.</p>
    %  end

    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Panel 5</h3>
        </div>
        <div class="panel-body">
            <p>A short text.</p>
        </div>
    </div>





=head2 Tables

L<Bootstrap documentation|http://getbootstrap.com/css/#tables>

=head3 Syntax

    %= table ($title,) %table_has, panel => { %panel_has }, begin
           $body
    %  end

B<C<$title>>

Optional. If set the table will be wrapped in a panel, and the table replaces the body in the panel.

B<C<$body>>

Mandatory. C<thead>, C<td> and so on.

B<C<panel =E<gt> { %panel_has }>>

Optional if the table has a C<$title>, otherwise without use.


=head3 Examples



=begin html

<p>

</p>

=end html

    <%= table begin %>
        <tr><td>Table 1</td></tr>
    <% end %>

    <table class="table">
        <tr><td>Table 1</td></tr>
    </table>

=begin html

<p>
A basic table.

</p>

=end html


    %= table hover, striped, condensed, begin
        <tr><td>Table 2</td></tr>
    %  end

    <table class="table table-condensed table-hover table-striped">
        <tr><td>Table 2</td></tr>
    </table>

=begin html

<p>
Several classes applied to the table.

</p>

=end html


    %= table 'Heading Table 4', panel => { success }, condensed, id => 'the-table', begin
        <tr><td>Table 4</td></tr>
    %  end

    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">Heading Table 4</h3>
        </div>
        <table class="table table-condensed" id="the-table">
            <tr><td>Table 4</td></tr>
        </table>
    </div>

=begin html

<p>
A <code>condensed</code> table with an <code>id</code> wrapped in a <code>success</code> panel.

</p>

=end html





=head1 OPTIONS

Some options are available:

    $app->plugin('BootstrapHelpers', {
        tag_prefix => 'bs',
        short_strappings_prefix => 'set',
        init_short_strappings => 1,
        icons => {
            class => 'glyphicon'
            formatter => 'glyphicon-%s',
        },
    });

=head2 tag_prefix

Default: C<undef>

If you want to you change the name of the tag helpers, by applying a prefix. These are not aliases;
by setting a prefix the original names are no longer available. The following rules are used:

=over 4

=item *
If the option is missing, or is C<undef>, there is no prefix.

=item *
If the option is set to the empty string, the prefix is C<_>. That is, C<panel> is now used as C<_panel>.

=item *
If the option is set to any other string, the prefix is that string. If you set C<tag_prefix =E<gt> 'bs'>, then C<panel> is now used as C<bspanel>.

=back

=head2 short_strappings_prefix

Default: C<undef>

This is similar to C<tag_prefix>, but is instead applied to the short form strappings. The same rules applies.


=head2 init_short_strappings

Default: C<1>

If you don't want the short form of strappings setup at all, set this option to a defined but false value.

All functionality is available, but instead of C<warning> you must now use C<__warning =E<gt> 1>.

With short form turned off, sizes are still only supported in long form: C<__xsmall>, C<__small>, C<__medium> and C<__large>. The Bootstrap abbreviations (C<xs> - C<lg>) are not used.

=head2 icons

Default: not set

By setting these keys you activate the C<icon> helper. You can pick any icon pack that sets one main class and one subclass to create an icon.

=over 4

B<C<class>>

This is the main icon class. If you use the glyphicon pack, this should be set to 'glyphicon'.

B<C<formatter>>

This creates the specific icon class. If you use the glyphicon pack, this should be set to 'glyphicon-%s', where the '%s' will be replaced by the icon name you give the C<icon> helper.

=back

=head1 AUTHOR

Erik Carlsson E<lt>csson@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2014- Erik Carlsson

Bootstrap itself is (c) Twitter. See L<their license information|http://getbootstrap.com/getting-started/#license-faqs>.

L<Mojolicious::Plugin::BootstrapHelpers> is third party software, and is not endorsed by Twitter.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
