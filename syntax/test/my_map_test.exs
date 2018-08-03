defmodule My.Map.Test do
  use ExUnit.Case

  test "Create a map" do
    colors = %{primary: "red", secondary: "blue"}
    assert colors.primary == "red"
    assert colors.secondary == "blue"
  end

  test "Update a map" do
    colors = %{primary: "red"}
    assert colors.primary == "red"

    colors1 = Map.put(colors, :primar, "blue")
    assert colors1.primar == "blue"

    colors2 = %{colors | primary: "green"}
    assert colors2.primary == "green"
    assert colors.primary == "red"
  end
end
