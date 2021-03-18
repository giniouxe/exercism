defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b, do: :equal
  def compare(_a, []), do: :superlist
  def compare([], _b), do: :sublist

  def compare(a, b) when length(a) >= length(b) do
    if is_sublist?(b, a), do: :superlist, else: :unequal
  end

  def compare(a, b) do
    if is_sublist?(a, b), do: :sublist, else: :unequal
  end

  defp is_sublist?([a_head | _a_tail] = a, b) do
    case Enum.find_index(b, fn x -> x == a_head end) do
      nil ->
        false

      index ->
        if remainder(b, index) |> List.starts_with?(a) do
          true
        else
          is_sublist?(a, remainder(b, index + 1))
        end
    end
  end

  defp remainder(list, index) do
    Enum.slice(list, index..(Enum.count(list) - 1))
  end
end
