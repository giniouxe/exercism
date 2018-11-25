defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    String.split(string, "", trim: true) |> do_encode(1, []) |> List.to_string()
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    String.split(string, ~r/\D/, include_captures: true) |> do_decode([]) |> List.to_string()
  end


  defp do_encode([], _, encoded_characters), do: Enum.reverse(encoded_characters)
  defp do_encode([head|tail], number, encoded_characters) do
    cond do
      head == List.first(tail) ->
        do_encode(tail, number + 1, encoded_characters)
      true ->
        encoded = encode_character(head, number)
        do_encode(tail, 1, [encoded | encoded_characters])
    end
  end

  defp encode_character(character, number) when number == 1, do: character
  defp encode_character(character, number), do: "#{number}#{character}"

  defp do_decode([], decoded_characters), do: Enum.reverse(decoded_characters)
  defp do_decode([head|tail], decoded_characters) do
    cond do
       String.match?(head, ~r/\d/) ->
        factor = String.to_integer(head) - 1
        decoded = String.duplicate(List.first(tail), factor)
        do_decode(tail, [decoded | decoded_characters])
      true ->
        do_decode(tail, [head | decoded_characters])
    end
  end
end
