defmodule MyPatternMatch do
  def puts(words, ext \\ nil)

  def puts(word, nil) do
    IO.puts(word)
  end
end
