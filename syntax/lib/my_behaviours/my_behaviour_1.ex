defmodule My.Behaviour1 do
  @callback read_data(String) :: String

  def read_data(path, implementation) do
    implementation.read_data(path)
  end
end
