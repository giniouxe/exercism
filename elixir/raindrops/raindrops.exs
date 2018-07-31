defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @mapping %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    output = factors_to_strings(number)
    cond do
      Enum.all?(output, fn(x) -> x == nil end) -> Integer.to_string(number)
      true -> Enum.join(output, "")
    end
  end

  defp factors_to_strings(number) do
    Map.keys(@mapping)
    |> Enum.reduce([], fn(factor, acc) -> [factor_to_string(number, factor) | acc] end)
    |> Enum.reverse()
  end

  defp factor_to_string(number, factor) do
    if Integer.mod(number, factor) == 0 do
      Map.get(@mapping, factor)
    end
  end
end
