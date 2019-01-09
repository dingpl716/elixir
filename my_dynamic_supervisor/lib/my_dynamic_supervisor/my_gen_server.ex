defmodule MyGenServer do
  use GenServer

  def start_link(server_id) do
    GenServer.start_link(__MODULE__, server_id)
  end

  def say(pid, words) do
    GenServer.call(pid, {:say, words})
  end

  def init(server_id) do
    {:ok, server_id}
  end

  def handle_call({:say, words}, _from, state) do
    IO.puts("Server #{state} says #{words}")

    if words == state do
      raise "oops"
    else
      {:reply, :ok, state}
    end
  end
end
