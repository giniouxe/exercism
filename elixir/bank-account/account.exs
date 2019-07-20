defmodule BankAccount do
  use GenServer

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @impl true
  def init(account) do
    {:ok, account}
  end

  # Server callbacks
  @impl true
  def handle_call(:balance, _from, account) do
    {:reply, account, account}
  end

  @impl true
  def handle_cast({:update, amount}, account) do
    {:noreply, account + amount}
  end

  def handle_cast({:close}, _account) do
    {:noreply, {:error, :account_closed}}
  end

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    GenServer.start_link(__MODULE__, 0)
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank({:ok, account}) do
    GenServer.cast(account, {:close})
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance({:ok, account}) do
    GenServer.call(account, :balance)
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update({:ok, account}, amount) do
    case balance({:ok, account}) do
      {:error, error} -> {:error, error}
      _ -> GenServer.cast(account, {:update, amount})
    end
  end
end
