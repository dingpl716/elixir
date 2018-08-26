defmodule MyFlowTest do
  use ExUnit.Case
  doctest MyFlow

  test "greets the world" do
    assert MyFlow.hello() == :world
  end
end
