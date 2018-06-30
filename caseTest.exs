defmodule CaseTest do
  # def test1() do
  #   case {1, 2, 3} do
  #     {1, y, 3} when y < 0 ->
  #       IO.puts "Should not match when y < 0, since the 2 is greater than 0."
  #     {1, x, 3} when x > 0 ->
  #       IO.puts "Matches when x > 0, because the 2 is greater than 0."
  #       _ ->
  #       IO.puts "Matches default."
  #   end
  # end

  def test2(x, y) do
    f1 = fn
      x, y when x > 0 -> IO.puts "Matches x > 0"
      x, y when y < 0 -> IO.puts "Matches y < 0"
      _, _ -> IO.puts "Matches default"
    end

    f1.(x, y);
  end
end


# CaseTest.test1()
CaseTest.test2(1, -1) # should matches x > 0
CaseTest.test2(-1, -1) # shoulde matches y < 0
CaseTest.test2(-1, 1) # shoulde matches default
