defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @mapping %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    collect_divisors([], number)
    |> Enum.map(fn(x) -> Map.get(@mapping, x) end)
    |> Enum.join("")
  end

  defp collect_divisors(list, 0) do
    Enum.reverse(list)
  end
  defp collect_divisors(list, number) do
    collect_divisors(
      [highest_divisor_for(number) | list],
      number - highest_divisor_for(number)
    )
  end

  defp highest_divisor_for(number) do
    Map.keys(@mapping)
    |> Enum.reverse()
    |> Enum.find(fn(divisor) -> Integer.floor_div(number, divisor) > 0 end)
  end
end
