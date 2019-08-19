defmodule MyReceive do
  def func(pid) do
    send(pid, "hello")

    receive do
    after
      5000 -> "world"
    end
  end
end
