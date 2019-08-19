defmodule MacroProvider do
  defmacro rpc(service, options, contents \\ []) do
    ast = compile(service, options, contents)

    term =
      quote do
        unquote(ast)
      end

    term
    |> Macro.to_string()
    |> String.replace(~r/(\(\s|\s\))/, "")
    |> String.replace(~r/def([^(]*)\((.*?)\) do/, "def\\1 \\2 do")
    |> String.replace(~r/create([^(]*)\((.*?)\) do/, "create\\1 \\2 do")
    |> IO.puts()

    ast
  end

  # credo:disable-for-lines:55
  defp compile(service, options, contents) do
    {body, options} =
      cond do
        Keyword.has_key?(contents, :do) ->
          {contents[:do], options}

        Keyword.has_key?(options, :do) ->
          Keyword.pop(options, :do)

        true ->
          raise ArgumentError, message: "expected one of :to or :do to be given as option"
      end

    mod = to_request_mod(service)

    quote bind_quoted: [
            mod: mod,
            service: service,
            options: options,
            body: Macro.escape(body, unquote: true)
          ] do
      default_opts = options[:opts] || []

      cond do
        options[:request_stream] == true ->
          def unquote(service)(reqs, chan \\ nil, opts \\ []) do
            chan = chan || "chan"
            fun = fn var!(res) -> unquote(body) end
            opts = Keyword.merge(unquote(default_opts), opts)
            # Helper.send_stream(unquote(service), chan, reqs, opts, fun)
          end

        options[:response_stream] == true and options[:no_params] == true ->
          def unquote(service)(chan \\ nil, opts \\ []) do
            chan = chan || "chan"
            req = apply(unquote(mod), :new, [])
            fun = fn var!(res) -> unquote(body) end
            opts = Keyword.merge(unquote(default_opts), opts)
            # Helper.send(unquote(service), chan, req, opts, fun)
          end

        options[:response_stream] == true ->
          def unquote(service)(req, chan \\ nil, opts \\ []) do
            chan = chan || "chan"
            fun = fn var!(res) -> unquote(body) end
            opts = Keyword.merge(unquote(default_opts), opts)
            # Helper.send(unquote(service), chan, req, opts, fun)
          end

        options[:no_params] == true ->
          def unquote(service)(chan \\ nil, opts \\ []) do
            chan = chan || "chan"
            req = apply(unquote(mod), :new, [])
            fun = fn var!(res) -> unquote(body) end
            opts = Keyword.merge(unquote(default_opts), opts)
            # Helper.send(unquote(service), chan, req, opts, fun)
          end

        true ->
          def unquote(service)(req, chan \\ nil, opts \\ []) do
            chan = chan || "chan"
            fun = fn var!(res) -> unquote(body) end
            opts = Keyword.merge(unquote(default_opts), opts)
            # Helper.send(unquote(service), chan, req, opts, fun)
          end
      end
    end
  end

  defp to_request_mod(service) do
    name =
      service
      |> Atom.to_string()

    # |> Rcase.to_pascal()

    String.to_atom("Elixir.ForgeAbi.Request#{name}")
  end
end

defmodule MacroUser do
  import MacroProvider

  rpc :subscribe, opts: [timeout: 5000, stream_mode: true] do
    res.value
  end
end
