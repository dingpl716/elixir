defmodule CondTest do
  def test1() do
    cond do
      1 + 1 == 3 -> "Should not match"
      2 * 2 == 5 -> "Should not match"
      3 + 3 == 6 -> "Should match"
      true -> "Should always match"
    end
  end
end

CondTest.test1();
