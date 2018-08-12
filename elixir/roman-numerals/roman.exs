defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @mapping [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    collect_roman_numerals("", number)
  end

  defp collect_roman_numerals(string, 0) do
    string
  end
  defp collect_roman_numerals(string, number) do
    {divisor, roman_numeral} = highest_divisor_for(number)
    String.replace_suffix(string, "", roman_numeral)
    |> collect_roman_numerals(number - divisor)
  end

  defp highest_divisor_for(number) do
    Enum.find(@mapping, fn(x) -> number >= elem(x, 0) end)
  end
end
