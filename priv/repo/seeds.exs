alias OhlcMoving.DataSchema, as: Schema

naive_datetime = NaiveDateTime.utc_now()
date = NaiveDateTime.truncate(naive_datetime, :second)

dummy_records =
  for i <- 1..30 do
    %{
      timestamp: ~U[2021-09-01T08:00:01Z] |> Timex.shift(months: i),
      open: 26.83 + i,
      high: 29.13 + i,
      low: 15.91 + i,
      close: 16.04 + i,
      inserted_at: date,
      updated_at: date
    }
  end

# Insert the dummy records into the database
OhlcMoving.Repo.insert_all(Schema, dummy_records)

# OhlcMoving.Repo.insert_all(OhlcMoving.DataSchema, [
#   %{
#     timestamp: ~U[2021-09-01T08:00:00Z],
#     open: 26.83,
#     high: 29.13,
#     low: 15.91,
#     close: 16.04,
#     inserted_at: date,
#     updated_at: date
#   },
#   %{
#     timestamp: ~U[2021-09-01T09:00:00Z],
#     open: 30.12,
#     high: 32.45,
#     low: 25.75,
#     close: 27.55,
#     inserted_at: date,
#     updated_at: date
#   }
# ])
