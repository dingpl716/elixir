defmodule MyDynamicSupervisorTest do
  use ExUnit.Case
  doctest MyDynamicSupervisor

  test "greets the world" do
    assert MyDynamicSupervisor.hello() == :world
  end
end
