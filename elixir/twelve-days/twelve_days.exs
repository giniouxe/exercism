defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @days %{
    1 => "first",
    2 => "second",
    3 => "third",
    4 => "fourth",
    5 => "fifth",
    6 => "sixth",
    7 => "seventh",
    8 => "eighth",
    9 => "ninth",
    10 => "tenth",
    11 => "eleventh",
    12 => "twelfth"
   }
   @gifts %{
     1 => "a Partridge in a Pear Tree.",
     2 => "two Turtle Doves,",
     3 => "three French Hens,",
     4 => "four Calling Birds,",
     5 => "five Gold Rings,",
     6 => "six Geese-a-Laying,",
     7 => "seven Swans-a-Swimming,",
     8 => "eight Maids-a-Milking,",
     9 => "nine Ladies Dancing,",
     10 => "ten Lords-a-Leaping,",
     11 => "eleven Pipers Piping,",
     12 => "twelve Drummers Drumming,"
    }
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    verse = get_day(number) <> get_gifts(number)
    cond do
      number > 1 -> String.replace(verse, ", a", ", and a")
      true -> verse
    end
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.map_join((starting_verse..ending_verse), "\n", &(verse(&1)))
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end

  defp get_day(number) do
    "On the #{Map.get(@days, number)} day of Christmas my true love gave to me: "
  end

  defp get_gifts(number) do
    Enum.map_join((number..1), " ", &(Map.get(@gifts, &1)))
  end
end
