# MyDynamicSupervisor

**TODO: Add description**

## Usage

```bash
iex -S mix
```

```elixir
iex(1)> {:ok, s123} = MyDynamicSupervisor.add_child("123")
{:ok, #PID<0.139.0>}
iex(2)> {:ok, s456} = MyDynamicSupervisor.add_child("456")
{:ok, #PID<0.141.0>}
```
