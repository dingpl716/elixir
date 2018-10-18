defmodule MyEcto.Repo.Migrations.Test1 do
  use Ecto.Migration

  def change do
    create table(:test1) do
      add(:uncle, :jsonb, [])
      add(:traces, {:array, :smallint}, [])
      add(:time, :timestamp, [])
      add(:price_f, :float, [])
    end
  end
end
