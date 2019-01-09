defmodule MyDynamicSupervisor do
  use DynamicSupervisor

  def start_link(args) do
    IO.inspect(args, label: "my ds start link")
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def add_child(server_id) do
    child_spec = %{
      # This id is used internally by supservisor.
      # It does not have to have a different value for different specs
      id: MyGenServer,
      start: {MyGenServer, :start_link, [server_id]}
    }

    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end
end
