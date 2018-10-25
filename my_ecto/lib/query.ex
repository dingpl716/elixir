defmodule MyEcto.Query do
  @moduledoc """
  Documentation for MyEcto.
  """
  alias MyEcto.Model
  alias MyEcto.Repo

  import Ecto.Query

  def get(id) do
    query =
      from(
        m in Model,
        where: m.id == ^id
      )

    Repo.one(query)
  end

  def insert(logs, tags) do
    %{
      tags: tags
    }
    |> Model.changeset()
    |> Repo.insert!()
  end
end
