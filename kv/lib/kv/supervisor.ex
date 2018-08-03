defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      {KV.Registry, name: KV.Registry}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end

defmodule KV.BucketSupervisor do
  def start_link(number, opts) do
    Supervisor.start_link(__MODULE__, number, opts)
  end

  def init(number) do
    children = [
      {DynamicSupervisor,
       name: String.to_atom("KV.BucketSupervisor_#{number}"), strategy: :one_for_one},
      {KV.Registry, name: String.to_atom("KV.Registry_#{number}")}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
