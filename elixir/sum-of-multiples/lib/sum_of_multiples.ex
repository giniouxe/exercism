defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    0..(limit - 1)
    |> Stream.filter(fn m ->
      Enum.any?(factors, fn f -> rem(m, f) == 0 end)
    end)
    |> Enum.sum()
  end
end
