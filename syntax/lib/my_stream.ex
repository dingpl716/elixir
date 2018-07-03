defmodule My.Stream do
  def take_every(from, to, batch) do
    from..to
    |> Stream.take_every(batch)
    |> Enum.map(fn element ->
      element
    end)
  end
end
