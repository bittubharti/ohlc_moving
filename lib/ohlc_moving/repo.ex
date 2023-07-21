defmodule OhlcMoving.Repo do
  use Ecto.Repo,
    otp_app: :ohlc_moving,
    adapter: Ecto.Adapters.Postgres
end
