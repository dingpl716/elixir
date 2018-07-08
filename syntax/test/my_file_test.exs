defmodule My.File.Test do
  use ExUnit.Case

  test "Open 1" do
    file = My.File.open("./lib/my_file.ex", [:read])
    :ok = My.File.close(file)
  end

  test "Open unknown file" do
    try do
      My.File.open("unknown.file", [:read])
    rescue
      e in RuntimeError -> IO.puts(inspect(e))
    end
  end
end
