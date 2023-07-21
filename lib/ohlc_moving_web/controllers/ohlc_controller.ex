defmodule OhlcMovingWeb.OhlcController do
  use Phoenix.Controller

  alias OhlcMovingWeb.QueryHandler
  alias OhlcMovingWeb.OhlcView

  def create(conn, %{"data" => data}) do
    with {:ok, ohlc_record} <- QueryHandler.create_ohlc_record(data) do
      conn
      |> put_status(:created)
      |> put_view(OhlcView)
      |> render("create.json", ohlc_record: ohlc_record)
    end
  end

  def average(conn, %{"window" => window}) do
    case window do
      "last_20_items" ->
        case QueryHandler.calculate_items_moving_average() do
          {:ok, average} ->
            conn
            |> put_status(:ok)
            |> put_view(OhlcView)
            |> render("average.json", average: average)

          {:error, message} ->
            conn
            |> put_status(:internal_server_error)
            |> put_view(OhlcView)
            |> render("error.json", error: message)
        end

      "last_1_hour" ->
        case QueryHandler.last_hour_moving_average() do
          {:ok, average} ->
            conn
            |> put_status(:ok)
            |> put_view(OhlcView)
            |> render("average.json", average: average)

          {:error, message} ->
            conn
            |> put_status(:internal_server_error)
            |> put_view(OhlcView)
            |> render("error.json", error: message)
        end

      _ ->
        conn
        |> put_status(:bad_request)
        |> render("error.json", error: "Invalid window parameter. Supported value: last_20_items")
    end
  end
end
