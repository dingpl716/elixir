defmodule My.MacroDefinition do
  defmacro say(options, contents \\ []) do
    name = Keyword.get(options, :name)
    body = Keyword.get(contents, :do)

    quote do
      def unquote(name)() do
        unquote(body)
      end
    end
  end
end

defmodule My.MacroClient do
  import My.MacroDefinition

  say name: :ppp do
    IO.puts("Hello")
  end
end
