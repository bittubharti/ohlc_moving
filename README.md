OHLC Moving Averages

The average of the open, high, low, and close (OHLC) for a given time frame is the average value of the opening price, the highest price that was reached, the lowest price that was reached, and the closing price. For example, a candlestick or price bar may have an open of 68, a high of 85, a low of 66, and a close of 72.

The calculation of the open, high, low, close average is calculated as follows:

OHLC Average = (68 + 85 + 66 + 72) / 4 = 72.75

The HLC Average is much the same except the open price is excluded, and the sum of the high, low, and close are divided by three. 

HLC Average = (85 + 66+ 72) / 3 = 74.33

Though the resulting averages are comparable, this shows how changing the parameters of the data being input affects the calculation of the indicator.
In this repo open, high, low, and close is being calculated based on last_20_items and last_1_hour.


# OhlcMoving

1. mix deps.get
2. Run mix ecto.create in the root directory
3. Run mix ecto.migrate in the root directory
4. Run mix setup to run seeds.ex file for data insertion and to install dependencies.
5. To test the test cases run mix test


To start your Phoenix server:

  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
