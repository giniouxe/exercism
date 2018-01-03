defmodule RotationalCipher do
  @alphabet String.graphemes("abcdefghijklmnopqrstuvwxyz")
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.graphemes(text)
    |> Enum.map(fn(letter)-> cipher(letter, shift, check_case(letter)) end)
    |> List.to_string
  end

  defp cipher(letter, shift, :downcased) do
    fetch_letter(letter, shift)
  end

  defp cipher(letter, shift, :upcased) do
    fetch_letter(String.downcase(letter), shift) |> String.upcase
  end

  defp check_case(letter) do
    if String.downcase(letter) == letter do :downcased else :upcased end
  end

  defp fetch_letter(letter, shift) do
    case get_index(letter, shift) do
      {:ok, index} -> Enum.fetch!(@alphabet, index)
      :error -> letter
    end
  end

  defp get_index(letter, shift) do
    index = @alphabet |> Enum.find_index(fn(x) -> x == letter end)
    if index == nil do
      :error
    else
      {:ok, index - length(@alphabet) + shift }
    end
  end
end
