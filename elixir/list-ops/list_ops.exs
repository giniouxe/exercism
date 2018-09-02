defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(list) do
    do_count(list, 0)
  end
  defp do_count([], acc), do: acc
  defp do_count([_ | tail], acc), do: do_count(tail, acc + 1)

  @spec reverse(list) :: list
  def reverse(list) do
    do_reverse(list, [])
  end
  defp do_reverse([], reversed_list), do: reversed_list
  defp do_reverse([head | tail], reversed_list), do: do_reverse(tail, [head | reversed_list])

  @spec map(list, (any -> any)) :: list
  def map(list, function) do
    do_map(list, function, [])
  end
  defp do_map([], _, acc), do: reverse(acc)
  defp do_map([head | tail], function, acc), do: do_map(tail, function, [function.(head) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, function) do
    do_filter(list, function, [])
  end
  defp do_filter([], _, acc) do
    reverse(acc)
  end
  defp do_filter([head | tail], function, acc) do
    cond do
      function.(head) == true -> do_filter(tail, function, [head | acc])
      true -> do_filter(tail, function, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(list, acc, function) do
    do_reduce(list, acc, function)
  end
  defp do_reduce([], acc, _), do: acc
  defp do_reduce([head | tail], acc, function), do: do_reduce(tail, function.(head, acc), function)

  @spec append(list, list) :: list
  def append(a, b) do
    reverse(a) |> do_append(b)
  end
  defp do_append([], b), do: b
  defp do_append([head | tail], b), do: do_append(tail, [head | b])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    do_concat([], ll)
  end
  defp do_concat(list, []), do: reverse(list)
  defp do_concat(list, [head | tail]), do: reverse(head) |> append(list) |> do_concat(tail)
end
