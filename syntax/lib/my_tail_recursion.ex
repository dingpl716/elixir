defmodule My.TailRecursion do
  def run(arg) do
    run(arg <> arg)
    IO.puts("done")
  end

  def run(old, new) do
    case old == new do
      true -> run(old, new + 1)
      false -> run(old, old)
    end
  end
end
