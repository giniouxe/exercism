defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @mapping  %{
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
    collect_roman_numerals("", number)
  end

  defp collect_roman_numerals(string, 0) do
    string
  end
  defp collect_roman_numerals(string, number) when number >= 1000 do
    String.replace_suffix(string, "", Map.get(@mapping, 1000))
    |> collect_roman_numerals(number - 1000)
  end
  defp collect_roman_numerals(string, number) when number >= 900 do
    String.replace_suffix(string, "", Map.get(@mapping, 900))
    |> collect_roman_numerals(number - 900)
  end
  defp collect_roman_numerals(string, number) when number >= 500 do
    String.replace_suffix(string, "", Map.get(@mapping, 500))
    |> collect_roman_numerals(number - 500)
  end
  defp collect_roman_numerals(string, number) when number >= 400 do
    String.replace_suffix(string, "", Map.get(@mapping, 400))
    |> collect_roman_numerals(number - 400)
  end
  defp collect_roman_numerals(string, number) when number >= 100 do
    String.replace_suffix(string, "", Map.get(@mapping, 100))
    |> collect_roman_numerals(number - 100)
  end
  defp collect_roman_numerals(string, number) when number >= 90 do
    String.replace_suffix(string, "", Map.get(@mapping, 90))
    |> collect_roman_numerals(number - 90)
  end
  defp collect_roman_numerals(string, number) when number >= 50 do
    String.replace_suffix(string, "", Map.get(@mapping, 50))
    |> collect_roman_numerals(number - 50)
  end
  defp collect_roman_numerals(string, number) when number >= 40 do
    String.replace_suffix(string, "", Map.get(@mapping, 40))
    |> collect_roman_numerals(number - 40)
  end
  defp collect_roman_numerals(string, number) when number >= 10 do
    String.replace_suffix(string, "", Map.get(@mapping, 10))
    |> collect_roman_numerals(number - 10)
  end
  defp collect_roman_numerals(string, number) when number >= 9 do
    String.replace_suffix(string, "", Map.get(@mapping, 9))
    |> collect_roman_numerals(number - 9)
  end
  defp collect_roman_numerals(string, number) when number >= 5 do
    String.replace_suffix(string, "", Map.get(@mapping, 5))
    |> collect_roman_numerals(number - 5)
  end
  defp collect_roman_numerals(string, number) when number >= 4 do
    String.replace_suffix(string, "", Map.get(@mapping, 4))
    |> collect_roman_numerals(number - 4)
  end
  defp collect_roman_numerals(string, number) when number >= 1 do
    String.replace_suffix(string, "", Map.get(@mapping, 1))
    |> collect_roman_numerals(number - 1)
  end

end
