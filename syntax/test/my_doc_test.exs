defmodule My.Doc.Test do
  use ExUnit.Case
  doctest My.Doc

  setup do
    {:ok, data} = prepare_data()
    %{prepared_data: data}
  end

  def prepare_data() do
    {:ok, []}
  end

  test("Test 1", %{prepared_data: data}) do
    # now you can use data as you wish.
    assert is_list(data) == true
  end
end
