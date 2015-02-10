defmodule Teenager do
  def hey(input) do
    input = String.strip(input)
    cond do
      String.length(input) == 0
        -> "Fine. Be that way!"
      String.upcase(input) == input && String.downcase(input) != input
        -> "Whoa, chill out!"
      String.ends_with?(input, "?")
        -> "Sure."
      String.length(input) > 0
        -> "Whatever."
    end
  end
end
