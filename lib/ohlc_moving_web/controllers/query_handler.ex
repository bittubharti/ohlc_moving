defmodule OhlcMovingWeb.QueryHandler do
  alias OhlcMoving.Repo
  alias OhlcMoving.DataSchema, as: Schema
  import Ecto.Query

  def create_ohlc_record(data) do
    changeset = Schema.changeset(%Schema{}, data)

    case Repo.insert(changeset) do
      {:ok, ohlc_data} -> {:ok, ohlc_data}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def calculate_items_moving_average() do
    last_20_items = fetch_last_20_items()

    length = length(last_20_items)

    if length == 0 do
      {:error, "No data found for moving average calculation"}
    else
      {total_open, total_high, total_low, total_close} =
        Enum.reduce(last_20_items, {0.0, 0.0, 0.0, 0.0}, fn item,
                                                            {acc_open, acc_high, acc_low,
                                                             acc_close} ->
          {acc_open + item.open, acc_high + item.high, acc_low + item.low, acc_close + item.close}
        end)

      average = %{
        open: Float.round(total_open / length, 2),
        high: Float.round(total_high / length, 2),
        low: Float.round(total_low / length, 2),
        close: Float.round(total_close / length, 2)
      }

      {:ok, average}
    end
  end

  def last_hour_moving_average() do
    from = Timex.shift(Timex.now(), seconds: -3600)

    query =
      from o in Schema,
        where: o.timestamp >= ^from

    query =
      from o in query,
        select: %{
          open_avg: avg(o.open),
          high_avg: avg(o.high),
          low_avg: avg(o.low),
          close_avg: avg(o.close)
        }

    case Repo.one(query) do
      nil ->
        {:error, "No data available for the last hour"}

      %{
        open_avg: open_avg,
        high_avg: high_avg,
        low_avg: low_avg,
        close_avg: close_avg
      } ->
        # Check if any of the averages are nil and set them to 0.0 if needed
        open_avg = default_to_zero(open_avg)
        high_avg = default_to_zero(high_avg)
        low_avg = default_to_zero(low_avg)
        close_avg = default_to_zero(close_avg)

        average = %{
          open: Float.round(open_avg, 2),
          high: Float.round(high_avg, 2),
          low: Float.round(low_avg, 2),
          close: Float.round(close_avg, 2)
        }

        {:ok, average}

      _ ->
        {:error, "Failed to calculate moving average"}
    end
  end

  # Helper function to set nil values to 0.0
  defp default_to_zero(nil), do: 0.0
  defp default_to_zero(value), do: value

  defp fetch_last_20_items do
    query =
      from o in Schema,
        order_by: [desc: o.timestamp],
        limit: 20

    Repo.all(query)
  end
end
