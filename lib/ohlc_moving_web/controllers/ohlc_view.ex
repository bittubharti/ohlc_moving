defmodule OhlcMovingWeb.OhlcView do
  def render("create.json", %{ohlc_record: ohlc_record}) do
    %{ohlc_record: %{"message" => "Data inserted successfully"}}
  end

  def render("average.json", %{average: average}) do
    %{average: average}
  end

  # Define the render/2 function for the "error.json" template
  def render("error.json", %{error: error}) do
    %{error: error}
  end
end
