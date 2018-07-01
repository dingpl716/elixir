defmodule My.Case do
  # def test1() do
  #   case {1, 2, 3} do
  #     {1, _y, 3} when _y < 0 ->
  #       IO.puts("Should not match when y < 0, since the 2 is greater than 0.")
  #
  #     {1, _x, 3} when _x > 0 ->
  #       IO.puts("Matches when x > 0, because the 2 is greater than 0.")
  #
  #     _ ->
  #       IO.puts("Matches default.")
  #   end
  # end

  def test2(x, y) do
    f1 = fn
      x, _y when x > 0 -> "Matches x > 0"
      _x, y when y < 0 -> "Matches y < 0"
      _, _ -> "Matches default"
    end

    f1.(x, y)
  end
end
