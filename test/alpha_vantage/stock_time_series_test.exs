defmodule AlphaVantage.StockTimeSeriesTest do
  use ExUnit.Case
  alias AlphaVantage.StockTimeSeries

  test "intraday/3" do
    assert {:ok, %{"Time Series (1min)" => _data}} = StockTimeSeries.intraday("AAPL", "1min")
  end

  test "intraday_extended_history/4" do
    assert {:ok, csv_string} =
             StockTimeSeries.intraday_extended_history("AAPL", "60min", "year1month1")

    assert is_binary(csv_string)
    assert String.contains?(csv_string, "volume")
  end

  test "daily/2" do
    assert {:ok, %{"Time Series (Daily)" => _data}} = StockTimeSeries.daily("AAPL")
  end

  test "daily_adjusted/2" do
    assert {:ok, %{"Time Series (Daily)" => _data}} = StockTimeSeries.daily_adjusted("AAPL")
  end

  test "weekly/2" do
    assert {:ok, %{"Weekly Time Series" => _data}} = StockTimeSeries.weekly("AAPL")
  end

  test "weekly_adjusted/2" do
    assert {:ok, %{"Weekly Adjusted Time Series" => _data}} =
             StockTimeSeries.weekly_adjusted("AAPL")
  end

  test "monthly/2" do
    assert {:ok, %{"Monthly Time Series" => _data}} = StockTimeSeries.monthly("AAPL")
  end

  test "monthly_adjusted/2" do
    assert {:ok, %{"Monthly Adjusted Time Series" => _data}} =
             StockTimeSeries.monthly_adjusted("AAPL")
  end
end
