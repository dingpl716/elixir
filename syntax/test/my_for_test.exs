defmodule My.For.Test do
  use ExUnit.Case

  test "method1" do
    assert My.For.method1(0, 5) == [0, 2, 4, 6, 8, 10]
  end
end
