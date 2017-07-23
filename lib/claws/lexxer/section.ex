defmodule CLAWS.Lexxer.Section do
  #######
  # API #
  #######

  def lex(doc) do
    body = String.split(doc,"\n")
    acc = []
    in_body(body, acc)
  end

  ###########
  # Private #
  ###########

  defp in_body([],acc) do
    Enum.reverse(acc)
  end

  # only section heads should start wth <<h::utf8(),"\b",h>>
  defp in_body([<<h::utf8(),"\b",h,_::binary()>>=sh|t],acc) do
    unless section_head?(sh), do: raise "this should not happen\n\n#{sh}"
    token = {:section_head, sh}
    in_section(t,[token|acc])
  end

  defp in_body([_|t],acc) do
    in_body(t,acc)
  end

  defp in_section(["       " <> sl|t],acc) do
    token = {:section_line,sl}
    in_section(t,[token|acc])
  end

  defp in_section(["", "       " <> sl|t],acc) do
    token1 = {:section_line,"\n"}
    token2 = {:section_line,sl}
    in_section(t,[token2|[token1|acc]])
  end

  defp in_section([_|t],acc) do
    in_body(t,acc)
  end

  defp section_head?(""), do: true

  defp section_head?(<<h::utf8(),"\b",h,t::binary()>>) when h in ?A..?Z do
    section_head?(t)
  end

  defp section_head?(<<" ",h::utf8(),"\b",h,t::binary()>>) when h in ?A..?Z do
    section_head?(t)
  end

  defp section_head?(_) do
    false
  end
end
