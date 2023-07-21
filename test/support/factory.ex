defmodule OhlcMoving.Factory do
  use ExMachina
  alias OhlcMoving.DataSchema

  def get_ohlc_data_factory do
    params = :ohlc_data |> build()
    struct(DataSchema, params)
  end

  def ohlc_data_factory do
    list = [
      %{
        timestamp: ~U[2021-06-01T08:00:00Z],
        open: 26.83,
        high: 29.13,
        low: 15.91,
        close: 16.04
      },
      %{
        timestamp: ~U[2021-09-01T09:00:00Z],
        open: 30.12,
        high: 32.45,
        low: 25.75,
        close: 27.55
      },
      %{
        timestamp: ~U[2023-04-01 08:00:01Z],
        open: 45.83,
        high: 48.12,
        low: 34.91,
        close: 35.04
      },
      %{
        timestamp: ~U[2022-12-01 08:00:01Z],
        open: 41.83,
        high: 44.12,
        low: 30.91,
        close: 31.04
      },
      %{
        timestamp: ~U[2024-03-01 08:00:01Z],
        open: 56.83,
        high: 59.12,
        low: 45.91,
        close: 46.04
      },
      %{
        timestamp: ~U[2024-02-01 08:00:01Z],
        open: 55.83,
        high: 58.12,
        low: 44.91,
        close: 45.04
      },
      %{
        timestamp: ~U[2024-01-01 08:00:01Z],
        open: 54.83,
        high: 57.12,
        low: 43.91,
        close: 44.04
      },
      %{
        timestamp: ~U[2023-12-01 08:00:01Z],
        open: 53.83,
        high: 56.12,
        low: 42.91,
        close: 43.04
      },
      %{
        timestamp: ~U[2023-11-01 08:00:01Z],
        open: 52.83,
        high: 55.12,
        low: 41.91,
        close: 42.04
      },
      %{
        timestamp: ~U[2023-10-01 08:00:01Z],
        open: 51.83,
        high: 54.12,
        low: 40.91,
        close: 41.04
      },
      %{
        timestamp: ~U[2023-09-01 08:00:01Z],
        open: 50.83,
        high: 53.12,
        low: 39.91,
        close: 40.04
      },
      %{
        timestamp: ~U[2023-08-01 08:00:01Z],
        open: 49.83,
        high: 52.12,
        low: 38.91,
        close: 39.04
      },
      %{
        timestamp: ~U[2023-07-01 08:00:01Z],
        open: 48.83,
        high: 51.12,
        low: 37.91,
        close: 38.04
      },
      %{
        timestamp: ~U[2023-06-01 08:00:01Z],
        open: 47.83,
        high: 50.12,
        low: 36.91,
        close: 37.04
      },
      %{
        timestamp: ~U[2023-05-01 08:00:01Z],
        open: 46.83,
        high: 49.12,
        low: 35.91,
        close: 36.04
      },
      %{
        timestamp: ~U[2023-04-01 08:00:01Z],
        open: 45.83,
        high: 48.12,
        low: 34.91,
        close: 35.04
      },
      %{
        timestamp: ~U[2023-03-01 08:00:01Z],
        open: 44.83,
        high: 47.12,
        low: 33.91,
        close: 34.04
      },
      %{
        timestamp: ~U[2023-02-01 08:00:01Z],
        open: 43.83,
        high: 46.12,
        low: 32.91,
        close: 33.04
      },
      %{
        timestamp: ~U[2023-01-01 08:00:01Z],
        open: 42.83,
        high: 45.12,
        low: 31.91,
        close: 32.04
      },
      %{
        timestamp: ~U[2022-12-01 08:00:01Z],
        open: 41.83,
        high: 44.12,
        low: 30.91,
        close: 31.04
      },
      %{
        timestamp: ~U[2022-11-01 08:00:01Z],
        open: 40.83,
        high: 43.12,
        low: 29.91,
        close: 30.04
      },
      %{
        timestamp: ~U[2022-10-01 08:00:01Z],
        open: 39.83,
        high: 42.12,
        low: 28.91,
        close: 29.04
      }
    ]

    # add more data here..

    data = Enum.reduce(list, %{}, fn map, acc -> Map.merge(acc, map) end)
    data
  end
end
