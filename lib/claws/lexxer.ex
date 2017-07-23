defmodule CLAWS.Lexxer do
  #######
  # API #
  #######

  def lex(doc) do
    CLAWS.Lexxer.Section.lex(doc)
  end
end
