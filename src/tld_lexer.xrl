%% src/tld_lexer.xrl

Definitions.

Whitespace = [\s\t]
Terminator = \n

Digit = [0-9]
Alpha = [a-zA-Z_-]
Formattingdelimiter = \b
Underlinedelimiter = _\b

Alpha  = {Alpha}
Heading = {Alpha}{Formattingdelimiter}{Alpha}
Headingword = {Heading}|{Heading}*
Word = {Alpha}|{Alpha}{Alpha}*

Rules.

{Whitespace} : skip_token.
{Terminator} : skip_token.
{Formattingdelimiter} : skip_token.
{Headingword} : {token, {heading, TokenLine, TokenChars}}.
{Word} : {token, {word, TokenLine, TokenChars}}.


Erlang code.
