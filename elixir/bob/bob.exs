defmodule Teenager do
  def hey(input) do
    input = String.strip(input)
    cond do
      silent?(input)
        -> "Fine. Be that way!"
      shouting?(input)
        -> "Whoa, chill out!"
      question?(input)
        -> "Sure."
      true
        -> "Whatever."
    end
  end

  defp silent?(input) do
    String.length(input) == 0
  end

  defp shouting?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
