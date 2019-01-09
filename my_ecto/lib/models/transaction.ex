defmodule MyEcto.Transaction do
  use Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  schema "transaction" do
    field(:height, :integer)
    field(:hash, :string)
  end

  def changeset(params, struct \\ MyEcto.Transaction) do
    struct
    |> struct()
    |> cast(params, [:height, :hash])
  end
end
