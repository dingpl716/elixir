defmodule My.Behaviour.Test do
  use ExUnit.Case

  test "Implementation 1" do
    assert My.Behaviour1.read_data("Content", My.Implementation1) ==
             "Content from implementation 1."
  end
end
