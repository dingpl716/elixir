defmodule MyFlow do
  def test1 do
    entries = [
      %{height: 100},
      %{height: 101},
      %{height: 102},
      %{height: 103},
      %{height: 104},
      %{height: 105},
      %{height: 106}
    ]

    entries
    |> Enum.chunk_every(2, 2, [])
    |> Flow.from_enumerable(stages: 32, max_demand: 1)
    |> Flow.map(&operation/1)
    |> Flow.reduce(fn -> %{} end, fn _, _ -> true end)
    |> Flow.run()

    IO.puts("*****Done******")
  end

  def test2 do
    entries = [
      %{height: 100},
      %{height: 101},
      %{height: 102},
      %{height: 103},
      %{height: 104},
      %{height: 105},
      %{height: 106}
    ]

    entries
    |> Enum.chunk_every(2, 2, [])
    |> Enum.map(fn entry -> Task.async(fn -> operation(entry) end) end)
    |> Enum.map(&Task.await(&1, :infinity))

    IO.puts("*****Done******")
  end

  defp operation(block) do
    if block.height == 106 do
      raise "Oops, 106"
    end

    IO.inspect(block)
  end
end
