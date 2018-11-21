defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_, size) when size <= 0 do
    []
  end
  def slices(s, size) when size == 1 do
    String.split(s, "", trim: true)
  end
  def slices(s, size) do
    cond do
      size > String.length(s) -> []
      true -> String.split(s, "", trim: true) |> do_slices([], size)
    end
  end

  defp do_slices([], slices, _) do
    Enum.reverse(slices)
  end
  defp do_slices([head | tail], slices, size) when length(tail) < size do
    do_slices([], [do_slice(head, tail, size) | slices], size)
  end
  defp do_slices([head | tail], slices, size) do
    do_slices(tail, [do_slice(head, tail, size) | slices], size)
  end

  defp do_slice(string, list, size) do
    Enum.reduce((0..size - 2), string, fn(n, acc) -> "#{acc}#{Enum.at(list, n)}" end)
  end
end
