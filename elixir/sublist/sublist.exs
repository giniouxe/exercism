defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist

  def compare(a, b) when a == b, do: :equal
  def compare(a, b) when length(a) >= length(b), do: find_superlist(a, b)
  def compare(a, b), do: find_sublist(a, b)

  defp find_superlist(a, b) do
    case find_sublist(b, a) do
      :sublist -> :superlist
      _ -> :unequal
    end
  end

  defp find_sublist(_a, []), do: :unequal

  defp find_sublist(a, b) when a == b, do: :sublist

  defp find_sublist([a_head | _a_tail] = a, b) do
    case Enum.find_index(b, fn x -> x == a_head end) do
      nil ->
        :unequal

      index ->
        if remainder(b, index) |> List.starts_with?(a) do
          :sublist
        else
          find_sublist(a, remainder(b, index + 1))
        end
    end
  end

  defp remainder(list, index) do
    Enum.slice(list, index..(Enum.count(list) - 1))
  end
end
