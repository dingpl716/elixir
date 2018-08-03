defmodule My.Implementation1 do
  @behaviour My.Behaviour1

  @spec read_data(String) :: String
  def read_data(path) do
    "#{path} from implementation 1."
  end
end
