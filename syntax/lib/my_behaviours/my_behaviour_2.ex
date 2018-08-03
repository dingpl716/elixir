defmodule My.Behaviour2 do
  @callback read_data(String) :: String

  defmacro __using__() do
    quote do
      @behaviour My.Behaviour2

      def function_name do
      end
    end
  end
end
