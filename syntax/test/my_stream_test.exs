defmodule My.Strea.Test do
  use ExUnit.Case

  test "Take every 1" do
    assert My.Stream.take_every(1, 10, 2) == [1, 3, 5, 7, 9]
  end

  test "Take every 2" do
    assert My.Stream.take_every(0, 10, 2) == [0, 2, 4, 6, 8, 10]
  end

  test "Take every 3" do
    assert My.Stream.take_every(1, 100, 99) == [1, 100]
  end

  test "Take every 4" do
    assert My.Stream.take_every(1, 70, 99) == [1]
  end
end
