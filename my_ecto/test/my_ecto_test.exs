defmodule MyEctoTest do
  use ExUnit.Case
  doctest MyEcto

  test "greets the world" do
    assert MyEcto.hello() == :world
  end
end
