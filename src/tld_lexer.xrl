%% src/tld_lexer.xrl

Definitions.

Whitespace = [\s\t]
Terminator = \n|\r\n|\r

Digit = [0-9]
Alphanum = [a-zA-Z]
Formattingdelimiter = \b
Underlinedelimiter

Alphanum  = {Alphanum}
Boldvalue = {AlphaNum}{Formattingdelimiter}{AlphaNum}

Rules.

{Whitespace} : skip_token.
{Terminator} : skip_token.
{Formattingdelimiter} : {token, {delim, TokenLine, TokenChars}}.
{Alphanum} : {token, {alpha, TokenLine, TokenChars}}.
{Boldvalue} : {token, {int, TokenLine, TokenChars}}.

Erlang code.
