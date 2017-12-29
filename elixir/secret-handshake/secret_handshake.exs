use Bitwise

defmodule SecretHandshake do
  @actions %{ 0b1 => "wink", 0b10 => "double blink", 0b100 => "close your eyes", 0b1000 => "jump" }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    add_action([0b1, 0b10, 0b100, 0b1000, 0b10000], code, [])
  end

  def add_action([head | tail], code, commands) do
    commands = case bits_set?(code, head) do
      {:ok, bits} when bits == 0b10000 -> Enum.reverse(commands)
      {:ok, _} -> List.insert_at(commands, -1, @actions[head])
      {:error, _} -> commands
    end

    add_action(tail, code, commands)
  end

  def add_action([], _, commands) do
    commands
  end

  def bits_set?(code, bits) do
    if (code &&& bits) > 0 do
      {:ok, bits}
    else
      {:error, "Bits not set"}
    end
  end
end
