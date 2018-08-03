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

  test "compare state, when synced" do
    current_state = %{hash: "bbb", pre_hash: "aaa", height: 2}
    latest_state = %{hash: "bbb", pre_hash: "aaa", height: 2}
    assert :synced == My.Case.compare_states(current_state, latest_state)
  end

  test "compare state, when chained" do
    current_state = %{hash: "bbb", pre_hash: "aaa", height: 2}
    latest_state = %{hash: "ccc", pre_hash: "bbb", height: 3}
    assert :chained == My.Case.compare_states(current_state, latest_state)
  end

  test "compare state, when forked" do
    current_state = %{hash: "bbb", pre_hash: "aaa", height: 2}
    latest_state = %{hash: "b'b'b'", pre_hash: "a'a'a'", height: 3}
    assert :forked == My.Case.compare_states(current_state, latest_state)
  end
end
