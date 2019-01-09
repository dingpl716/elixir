defmodule MyEcto.Query do
  @moduledoc """
  Documentation for MyEcto.
  """
  alias MyEcto.{Block, Transaction, Model}
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

  def query1(height, hash) do
    query =
      from(
        b in Block,
        # order_by: [desc: b.height],
        where: b.height == ^height
      )

    query =
      case hash do
        "" ->
          query

        _ ->
          from(
            t in Transaction,
            join: b in ^query,
            on: b.height == t.height,
            where: t.hash == ^hash
          )
      end

    IO.inspect(query)
    Repo.all(query)
  end

  def query2(height, hash) do
    query = from(b in Block, where: b.height == ^height)

    query
    |> join(:inner, [q], t in Transaction, q.height == t.height and t.hash == ^hash)
    |> join(:inner, [q], m in Model, q.height == m.id)
    |> IO.inspect()
  end
end
