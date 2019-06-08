defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.
  """

  # Valid directions are: `:north`, `:east`, `:south`, `:west`
  @valid_directions [:north, :east, :south, :west]

  defstruct [:direction, :position]

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, _) when direction not in @valid_directions do
    {:error, "invalid direction"}
  end
  def create(_, position) when not is_tuple(position) or tuple_size(position) != 2 do
    {:error, "invalid position"}
  end
  def create(_, {x, y}) when not is_integer(x) or not is_integer(y) do
    {:error, "invalid position"}
  end
  def create(direction, position) do
    %RobotSimulator{direction: direction, position: position}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    case instructions |> String.split("", trim: true) |> move(robot.direction, robot.position) do
      %{direction: direction, position: position} -> %{robot | direction: direction, position: position}
      _ -> {:error, "invalid instruction"}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot), do: robot.position

  defp move([], direction, position), do: %{direction: direction, position: position}
  defp move(["L" | instructions], direction, position) do
    move(instructions, turn_left(direction), position)
  end
  defp move(["R" | instructions], direction, position) do
    move(instructions, turn_rigth(direction), position)
  end
  defp move(["A" | instructions], direction, position) do
    move(instructions, direction, advance(direction, position))
  end
  defp move([_ | _], _, _), do: {:error}

  defp turn_left(:north), do: :west
  defp turn_left(:east), do: :north
  defp turn_left(:south), do: :east
  defp turn_left(:west), do: :south

  defp turn_rigth(:north), do: :east
  defp turn_rigth(:east), do: :south
  defp turn_rigth(:south), do: :west
  defp turn_rigth(:west), do: :north

  defp advance(:north, {x, y}), do: {x, (y + 1)}
  defp advance(:east, {x, y}), do: {(x + 1), y}
  defp advance(:south, {x, y}), do: {x, y - 1}
  defp advance(:west, {x, y}), do: {(x - 1), y}
end
