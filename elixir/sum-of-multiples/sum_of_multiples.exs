defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    0..(limit - 1)
    |> Enum.filter(fn m ->
      Enum.any?(factors, fn f -> rem(m, f) == 0 end)
    end)
    |> Enum.reduce(0, fn m, acc -> acc + m end)
  end
end
