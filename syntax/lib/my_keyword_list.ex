defmodule My.Keyword.List do
  def plus_one(list) do
    Enum.map(list, fn {key, word} ->
      case key do
        :number -> {key, word + 1}
        _ -> {key, word}
      end
    end)
  end
end
