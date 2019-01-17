defmodule MyGenServer do
  @moduledoc """
  This module shows that directly throwing exception in a GenServer is not a good iead as
  the thrown exception cannot be caught by the caller.
  """
  use GenServer

  @default_name __MODULE__

  def say do
    name = nil || @default_name
    IO.puts(name)
  end

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def add(word) do
    GenServer.call(__MODULE__, {:add, word})
  end

  def look(word) do
    GenServer.call(__MODULE__, {:look, word})
  end

  def init(:ok) do
    {:ok, []}
  end

  def handle_call({:add, word}, _from, _state) do
    raise "Unsupport word"
  end

  def handle_call({:look, word}, _from, state) do
    {:reply, {:error, "look error"}, state}
  end
end

# MyGenServer.start_link()
#
# try do
#   MyGenServer.add(123)
# rescue
#   # IO.puts("@@@@@@@@@@@@@@@")
#   e -> IO.inspect(e, label: "@@@@@")
# end
#
# MyGenServer.start_link()
#
# try do
#   MyGenServer.add(123)
# catch
#   e -> IO.inspect(e)
# end
