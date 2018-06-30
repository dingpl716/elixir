defmodule ModuleTest do
  def zero?(0) do
    true
  end
end

IO.puts ModuleTest.zero?(0)
# IO.puts ModuleTest.zero?(1)
