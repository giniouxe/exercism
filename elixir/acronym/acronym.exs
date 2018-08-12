defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, ~r{ |(?=[A-Z])}, trim: true)
    |> Enum.map_join(&(capitalize_first(&1)))
  end

  defp capitalize_first(string) do
    String.first(string) |> String.capitalize()
  end
end
