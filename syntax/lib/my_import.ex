defmodule My.Module_To_Import_1 do
  def duplicate_function do
    __MODULE__
  end
end

defmodule My.Module_To_Import_2 do
  def duplicate_function do
    __MODULE__
  end
end

defmodule My.Import do
  import(My.Module_To_Import_1)
  import(My.Module_To_Import_2)

  def print do
    # The following line will get a compile error 
    # module = duplicate_function()
  end
end
