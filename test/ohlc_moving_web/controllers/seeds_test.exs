defmodule OhlcMovingWeb.SeedsTest do
  import OhlcMoving.Factory

  def get_ohlc_data() do
    {:ok, ohlc_data} =
      OhlcMovingWeb.QueryHandler.create_ohlc_record(build(:ohlc_data))

    %{
      ohlc_data: ohlc_data
    }
  end
end
