defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], _fun), do: []
  def keep([element | tail], fun) do
    cond do
      fun.(element) == true -> [element | keep(tail, fun)]
      fun.(element) == false -> keep(tail, fun)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard([], _fun), do: []
  def discard([element | tail], fun) do
    cond do
      fun.(element) == false -> [element | discard(tail, fun)]
      fun.(element) == true -> discard(tail, fun)
    end
  end
end
