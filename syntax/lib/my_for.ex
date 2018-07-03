defmodule My.For do
  def method1(from, to) do
    from..to
    |> Enum.map(fn element -> element * 2 end)
  end
end
