defmodule My.Task do
  def main() do
    Process.flag(:trap_exit, true)

    task =
      Task.async(fn ->
        Process.sleep(1000)
        IO.puts(" 2 ")
      end)

    Task.await(task, 3000)
    handle()
  end

  def handle() do
    receive do
      {:DOWN, msg} -> IO.puts("Handling Down, #{msg}")
      {:EXIT, msg} -> IO.puts("Handling EXIT, #{msg}")
      {signal, msg} -> IO.puts("Handling #{signal}, #{msg}")
    end
  end

  def test_async_stream() do
    1..10
    |> Task.async_stream(&IO.puts(inspect(&1)))
    |> Enum.to_list()
  end
end
