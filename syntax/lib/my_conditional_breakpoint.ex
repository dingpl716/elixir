defmodule My.Conditional.Breakpoint do
  # :debugger.start()
  # :int.ni(The.Module.You.Want.To.Break)
  # :int.break(he.Module.You.Want.To.Break, linenumber)
  # Mix.Tasks.Ethereum.Indexer.run(["1000000","1000000"])
  def break(Bindings) do
    case int.get_binding('key', Bindings) do
      {value, 'standardV'} -> true
      _ -> false
    end
  end
end
