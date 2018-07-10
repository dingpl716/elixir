defmodule My.Agent do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def get(map, key) do
    Agent.get(map, &Map.get(&1, key))
  end
end
