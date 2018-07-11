defmodule My.Keyword.List.Test do
  use(ExUnit.Case)

  test "Create a keyword list" do
    keyword_list_1 = [{:primary, "red"}, {:secondary, "blue"}]
    assert keyword_list_1[:primary] == "red"
    keyword_list_2 = [primary: "red", secondary: "blue"]
    assert(keyword_list_2[:primary] == "red")
  end

  test "Puse one" do
    newlist = My.Keyword.List.plus_one([{:number, 1}, {:string, "red"}])
    assert [{:number, 2}, {:string, "red"}] == newlist
  end

  test "Pluse one" do
    newlist = My.Keyword.List.plus_one(number: 1, string: "red")
    assert [number: 2, string: "red"] == newlist
  end
end
