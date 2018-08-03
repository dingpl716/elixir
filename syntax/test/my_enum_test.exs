defmodule My.Enum.Test do
  use ExUnit.Case

  test "Reduce Test 1" do
    result =
      [%{height: 10}, %{height: 11}, %{height: 12}, %{height: 13}]
      |> Enum.reduce(%{latest_height: 9}, fn new_block, acc ->
        %{acc | latest_height: new_block.height}
      end)

    assert result == %{latest_height: 13}
  end

  def update(new_block, state) do
    %{state | latest_height: new_block.height}
  end

  test "Reduce Test 2" do
    result =
      [%{height: 10}, %{height: 11}, %{height: 12}, %{height: 13}]
      |> Enum.reduce(%{latest_height: 9}, &update(&1, &2))

    assert result == %{latest_height: 13}
  end
end
