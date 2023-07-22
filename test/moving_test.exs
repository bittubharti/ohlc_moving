defmodule OhlcMovingWeb.MovingTest do
  use ExUnit.Case, async: true
  use OhlcMovingWeb.ConnCase

  import OhlcMoving.Factory
  import OhlcMovingWeb.SeedsTest
  alias OhlcMovingWeb.OhlcController
  alias OhlcMovingWeb.QueryHandler

  setup do
    # Generate sample data using Factory and insert into the database
    ohlc_data = build(:ohlc_data)
    {:ok, ohlc_record} = QueryHandler.create_ohlc_record(ohlc_data)

    # Ensure to return the connection as a map
    conn = build_conn()
    %{conn: conn, ohlc_record: ohlc_record}
  end

  describe "average endpoint" do
    test "last_20_items returns average for last 20 items", %{
      conn: conn,
      ohlc_record: ohlc_record
    } do
      # Make a request to the controller
      data =
        OhlcController.average(conn, %{"window" => "last_20_items"})

      %{average: %{open: open, high: high, low: low, close: close}} = data.assigns

      # Create the desired map
      actual_verage = %{open: open, high: high, low: low, close: close}

      # Define your expected average

      expected_average = %{open: 39.83, high: 42.12, low: 28.91, close: 29.04}

      # Compare the expected average with the actual average
      assert actual_verage == expected_average
    end

    test "last_1_hour returns average for last 1 hour", %{conn: conn, ohlc_record: ohlc_record} do
      # Make a request to the controller
      data =
        OhlcController.average(conn, %{"window" => "last_1_hour"})

      %{average: %{open: open, high: high, low: low, close: close}} = data.assigns

      # Create the desired map
      actual_verage = %{open: open, high: high, low: low, close: close}

      # Define the expected average for the last 1 hour, currenlty doesn't contain avg for dummy data
      # change your expected result according to your data
      expected_average = %{open: 0.0, high: 0.0, low: 0.0, close: 0.0}

      # Compare the expected average with the actual average
      assert actual_verage == expected_average
    end
  end
end
