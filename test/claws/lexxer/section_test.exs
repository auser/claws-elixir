defmodule CLAWS.Lexxer.SectionTest do
  use ExUnit.Case, async: true

  setup_all do
    doc =
      """
      ignore()                                  ignore()


      N\bNA\bAM\bME\bE
             test_section -

      C\bCO\bOM\bMM\bMA\bAN\bND\bDS\bS
             command1

             command2


      ignore()                                  ignore()
      """
    context = [tokens: CLAWS.Lexxer.Section.lex(doc)]
    {:ok,context}
  end

  test "expected tokens", c do
    tokens = [
      section_head: "N\bNA\bAM\bME\bE",
      section_line: "test_section -",
      section_head: "C\bCO\bOM\bMM\bMA\bAN\bND\bDS\bS",
      section_line: "command1",
      section_line: "\n",
      section_line: "command2",
    ]

    assert c.tokens == tokens
  end
end
