defmodule ChatServer do
  # use Application

  @moduledoc """
  Documentation for ChatServer.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ChatServer.hello
      :world

  """
  def start() do
    spawn(&loop/0)
  end

  def start_map() do
    spawn(fn -> loop_map(%{}) end)
  end

  def loop() do
    receive do
      {:message, pid, msg} ->
        send(pid, "I received your message: #{msg}")
        loop()
    end
  end

  def loop_map(map) do
    receive do
      {:add, pid, key, value} ->
        send(pid, "I received your message: #{msg}")
        loop_map(Map.put(map, key, value))

      {:get, pid, key} ->
        send(pid, Map.get(map, key))
        loop(map)
    end
  end
end
