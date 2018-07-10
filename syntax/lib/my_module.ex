defmodule ModuleTest do
  def zero?(0) do
    true
  end

  def print_module do
    IO.puts(inspect(__MODULE__))
  end
end

IO.puts(ModuleTest.zero?(0))
# IO.puts ModuleTest.zero?(1)
