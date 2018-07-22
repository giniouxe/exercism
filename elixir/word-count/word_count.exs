defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.split(~r{[!?&@$%^&",;:/*()#~_ ]}, trim: true)
    |> counts_by_word
  end

  def counts_by_word(words) do
    Map.new(words, fn(word) -> {word, word_count(words, word, 0)} end)
  end

  def word_count([head | tail], word, count) do
    case head do
      ^word -> word_count(tail, word, count + 1)
      _ -> word_count(tail, word, count)
    end
  end
  def word_count([], _, count), do: count
end
