defmodule MyEcto.Repo.Migrations.Model do
  use Ecto.Migration

  def change do
    create table(:model) do
      add(:logs, :jsonb, [])
      add(:tags, {:array, :string}, [])
    end
  end
end
