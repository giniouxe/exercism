defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search({key}, key), do: {:ok, 0}
  def search(numbers, key) when elem(numbers, tuple_size(numbers) - 1) < key do
    :not_found
  end
  def search(numbers, key) when elem(numbers, 0) > key, do: :not_found
  def search(numbers, key) do
    index = tuple_size(numbers) / 2 |> floor()
    find(numbers, key, index)
  end

  defp find(_, _, -1), do: :not_found
  defp find(numbers, _, index) when tuple_size(numbers) == index, do: :not_found
  defp find(numbers, key, index) when index == 0 and elem(numbers, index) != key do
    :not_found
  end
  defp find(numbers, key, index) when index == (tuple_size(numbers) - 1) and elem(numbers, index) != key do
    :not_found
  end
  defp find(numbers, key, index) when elem(numbers, index) > key do
    find(numbers, key, index - 1)
  end
  defp find(numbers, key, index) when elem(numbers, index) < key do
    find(numbers, key, index + 1)
  end
  defp find(numbers, key, index) when elem(numbers, index) == key do
    {:ok, index}
  end
end
