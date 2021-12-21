defmodule AlphaVantage.ForexTest do
  use ExUnit.Case
  alias AlphaVantage.Forex

  test "exchange_rate/3" do
    assert {:ok, %{"Realtime Currency Exchange Rate" => _data}} =
             Forex.exchange_rate("USD", "CAD")
  end

  test "intraday/4" do
    assert {:ok, %{"Time Series FX (60min)" => _data}} = Forex.intraday("USD", "CAD", "60min")
  end

  test "daily/3" do
    assert {:ok, %{"Time Series FX (Daily)" => _data}} = Forex.daily("USD", "CAD")
  end

  test "weekly/3" do
    assert {:ok, %{"Time Series FX (Weekly)" => _data}} = Forex.weekly("USD", "CAD")
  end

  test "monthly/3" do
    assert {:ok, %{"Time Series FX (Monthly)" => _data}} = Forex.monthly("USD", "CAD")
  end
end
