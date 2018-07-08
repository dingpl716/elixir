defmodule My.Struct.Test do
  use ExUnit.Case

  alias(My.Struct, as: Block)

  test "Create a struct" do
    block1 = %My.Struct{}
    assert block1 != nil
    assert block1.height == nil
    assert block1.hash == nil
    assert block1.pre_hash == nil
  end

  test "Create a aliased struct" do
    block1 = %Block{}
    assert block1 != nil
    assert block1.height == nil
    assert block1.hash == nil
    assert block1.pre_hash == nil
  end

  test "Modify a struct" do
    block1 = %Block{}
    block2 = %{block1 | height: 1}
    assert block1 != nil
    assert block1.height == nil
    assert block2 != nil
    assert block2.height == 1
  end
end
