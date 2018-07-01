current = self()
IO.puts inspect current
spawn fn -> send(current, {:hello, self()}) end
receive do
  {:hello, pid} -> IO.puts "Got hello from #{inspect pid}"
end
