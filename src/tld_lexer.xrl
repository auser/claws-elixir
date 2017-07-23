%% src/tld_lexer.xrl

Definitions.

Whitespace = [\s\t]
Terminator = \n|\r\n|\r

Digit = [0-9]
AlphaNum = [a-zA-Z]
FormattingDelimiter = \\b

AlphaNum  = {AlphaNum}
BoldValue = {AlphaNum}{FormattingDelimiter}{AlphaNum}

Rules.

{Whitespace} : skip_token.
{Terminator} : skip_token.
{Bold} : {token, {int, TokenLine, TokenChars}}.

Erlang code.
