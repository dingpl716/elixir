defmodule My.Case.Test do
  use ExUnit.Case

  test "test2 x > 0" do
    assert My.Case.test2(1, -1) == "Matches x > 0"
  end

  test "test2 y < 0" do
    assert My.Case.test2(-1, -1) == "Matches y < 0"
  end

  test "test2 default" do
    assert My.Case.test2(-1, 1) == "Matches default"
  end
end
