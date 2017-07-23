defmodule CLAWS.LexxerTest do
  use ExUnit.Case, async: true

  setup_all do
    {:ok, doc} = File.read("test/support/cached_docs/aws_help.txt")
    context = [tokens: CLAWS.Lexxer.lex(doc)]
    {:ok,context}
  end

  describe "lexxing command line output of `aws help`" do
    test "returns Keyword", c do
      assert Keyword.keyword?(c.tokens)
    end
  end
end
