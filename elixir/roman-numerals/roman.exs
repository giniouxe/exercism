defmodule Roman do
  @doc """
  Convert the n to a roman n.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(n), do: do_numerals("", n)

  defp do_numerals(string, n) when n >= 1000, do: string <> "M" |> do_numerals(n - 1000)
  defp do_numerals(string, n) when n >= 900, do: string <> "CM" |> do_numerals(n - 900)
  defp do_numerals(string, n) when n >= 500, do: string <> "D" |> do_numerals(n - 500)
  defp do_numerals(string, n) when n >= 400, do: string <> "CD" |> do_numerals(n - 400)
  defp do_numerals(string, n) when n >= 100, do: string <> "C" |> do_numerals(n - 100)
  defp do_numerals(string, n) when n >= 90, do: string <> "XC" |> do_numerals(n - 90)
  defp do_numerals(string, n) when n >= 50, do: string <> "L" |> do_numerals(n - 50)
  defp do_numerals(string, n) when n >= 40, do: string <> "XL" |> do_numerals(n - 40)
  defp do_numerals(string, n) when n >= 10, do: string <> "X" |> do_numerals(n - 10)
  defp do_numerals(string, n) when n >= 9, do: string <> "IX" |> do_numerals(n - 9)
  defp do_numerals(string, n) when n >= 5, do: string <> "V" |> do_numerals(n - 5)
  defp do_numerals(string, n) when n >= 4, do: string <> "IV" |> do_numerals(n - 4)
  defp do_numerals(string, n) when n >= 0, do: string <> String.duplicate("I", n)
end
