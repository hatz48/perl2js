package P2JS::Converter::Node::ElseStmt;
use strict;
use warnings;
use parent 'P2JS::Converter::Node';

use P2JS::Converter::Node::Nop;

use P2JS::Node::ElseStmt;

sub stmt { shift->{stmt} }

sub to_js_ast {
    my ($self, $context) = @_;
    return P2JS::Node::ElseStmt->new(
        token => $self->token,
        stmt  => $self->stmt->to_js_ast($context),
        next => $self->next->to_js_ast($context),
    );
}

1;

__END__

=pod

=head1 NAME

P2JS::Converter::Node::ElseStmt

=head1 INHERITANCE

    P2JS::Converter::Node::ElseStmt
    isa P2JS::Converter::Node

=head1 DESCRIPTION

    ElseStmt node has single pointer of 'stmt'.
    Also, this node has 'next' pointer to access next statement's node.

=head1 LAYOUT

     _____________        ___________
    |             | next |           |
    |   ElseStmt  |----->|           |
    |_____________|      |___________|
           |
      stmt |
           v

=head2 Example

e.g.) else { $a++; } ...

            |
     _______|_______        _________
    |               | next |         |
    |   ElseStmt    |----->|  .....  |
    |_______________|      |_________|
            |
      stmt  |
     _______v_______
    |               |
    |     Inc(++)   |
    |_______________|
            |
      expr  |
     _______v_______
    |               |
    |      $a       |
    |_______________|


=head1 SEE ALSO

[P2JS::Converter::Node](http://search.cpan.org/perldoc?Compiler::Parser::Node)

=head1 AUTHOR

Masaaki Goshima (goccy) <goccy54@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) Masaaki Goshima (goccy).

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
