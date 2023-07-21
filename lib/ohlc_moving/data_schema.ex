defmodule OhlcMoving.DataSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ohlc_details" do
    field :timestamp, :utc_datetime
    field :open, :float
    field :high, :float
    field :low, :float
    field :close, :float

    timestamps()
  end

  def changeset(schema, params) do
    schema
    |> cast(params, [:timestamp, :open, :high, :low, :close])
    |> validate_required([:timestamp, :open, :high, :low, :close])
  end
end
