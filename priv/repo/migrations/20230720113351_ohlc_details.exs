defmodule OhlcMoving.Repo.Migrations.OhlcDetails do
  use Ecto.Migration

  def change do
    create table(:ohlc_details) do
      add :timestamp, :utc_datetime
      add :open, :float
      add :high, :float
      add :low, :float
      add :close, :float

      timestamps()
    end

    create index(:ohlc_details, [:timestamp])
  end
end
