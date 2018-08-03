defmodule KV do
  use Application

  def start(_type, _args) do
    KV.BucketSupervisor.start_link(1, name: :RegistrySupervisor1)
    KV.BucketSupervisor.start_link(2, name: :RegistrySupervisor2)
    # KV.Supervisor.start_link(name: KV.Supervisor)
  end
end
