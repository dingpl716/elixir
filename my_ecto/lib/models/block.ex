defmodule MyEcto.Block do
  use Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  schema "block" do
    field(:height, :integer)
    field(:logs, :string)
    field(:tags, :string)
  end

  def changeset(params, struct \\ MyEcto.Block) do
    struct
    |> struct()
    |> cast(params, [:height, :logs, :tags])
  end
end
