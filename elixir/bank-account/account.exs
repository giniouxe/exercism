defmodule BankAccount do
  use Agent

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @spec open_bank() :: account
  def open_bank() do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank({:ok, account}) do
    Agent.stop(account, :normal)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance({:ok, account}) do
    if Process.alive?(account) do
      Agent.get(__MODULE__, & &1)
    else
      {:error, :account_closed}
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update({:ok, account}, amount) do
    if Process.alive?(account) do
      Agent.update(account, fn state -> state + amount end)
    else
      {:error, :account_closed}
    end
  end
end
