defmodule My.Keyword.List.Test do
  use(ExUnit.Case)

  test "Create a keyword list" do
    keyword_list_1 = [{:primary, "red"}, {:secondary, "blue"}]
    assert keyword_list_1[:primary] == "red"
    keyword_list_2 = [primary: "red", secondary: "blue"]
    assert(keyword_list_2[:primary] == "red")
  end
end
