defmodule MyEcto.Repo.Migrations.BlockTx do
  use Ecto.Migration

  def change do
    create table(:block) do
      add(:height, :integer, [])
      add(:logs, :string, [])
      add(:tags, :string, [])
    end

    create table(:transaction) do
      add(:height, :integer, [])
      add(:hash, :string, [])
    end
  end
end
