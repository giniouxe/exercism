defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @consonants_regex ~r/^[^aeiou]+((?<=q)u)*/
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase)
    |> Enum.map(fn(word) -> translate_word(word) end)
    |> Enum.join(" ")
  end

  def translate_word(word) do
    cond do
      String.match?(word, ~r/^(y|x)[^aeiou]/) ->
        add_suffix(word)
      String.match?(word, @consonants_regex) ->
        move_first_consonants_back(word) |> add_suffix
      true ->
        add_suffix(word)
    end
  end

  def add_suffix(word) do
    String.replace_suffix(word, "", "ay")
  end

  def move_first_consonants_back(word) do
    String.replace_suffix(word, "", first_consonants(word))
    |> String.replace_prefix(first_consonants(word), "")
  end

  def first_consonants(word) do
    String.split(word, @consonants_regex, include_captures: true)
    |> Enum.fetch!(1)
  end
end
