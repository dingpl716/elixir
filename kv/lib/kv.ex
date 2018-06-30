defmodule KV do
  use Application

  def start(_type, _args) do
    KV.BucketSupervisor.start_link(name: KV.Supervisor)
    # KV.Supervisor.start_link(name: KV.Supervisor)
  end
end
