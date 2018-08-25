defmodule MyEcto.Model do
  use Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  schema "model" do
    field(:logs, :map)
    field(:tags, {:array, :string})
  end

  def changeset(params, struct \\ MyEcto.Model) do
    struct
    |> struct()
    |> cast(params, [:logs, :tags])
  end
end
