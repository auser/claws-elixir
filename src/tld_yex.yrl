Nonterminals
document
values value.

Terminals
alphanum.

Rootsymbol document.

document -> values : '$1'.

values -> value : '$1'.
values -> value values : '$1' ++ '$2'.

value -> alphanum.

Erlang code.

