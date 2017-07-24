Nonterminals
document
values value.

Terminals
headingword
alphanum.

Rootsymbol document.

document -> values : '$1'.

values -> value : '$1'.
values -> value values : '$1' ++ '$2'.

value -> alphanum.
value -> headingword : '$1'.

Erlang code.

