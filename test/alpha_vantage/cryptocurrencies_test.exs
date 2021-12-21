defmodule AlphaVantage.CryptocurrenciesTest do
  use ExUnit.Case
  alias AlphaVantage.Cryptocurrencies

  test "exchange_rate/3" do
    assert {:ok, %{"Realtime Currency Exchange Rate" => _data}} =
             Cryptocurrencies.exchange_rate("BTC", "ETH")
  end

  test "alpha_vantage_coin/1" do
    assert {:ok, %{"Realtime Currency Exchange Rate" => _data}} =
             Cryptocurrencies.alpha_vantage_coin()
  end

  test "intraday/4" do
    assert {:ok, %{"Time Series Crypto (60min)" => _data}} =
             Cryptocurrencies.intraday("BTC", "USD", "60min")
  end

  test "daily/3" do
    assert {:ok, %{"Time Series (Digital Currency Daily)" => _data}} =
             Cryptocurrencies.daily("BTC", "USD")
  end

  test "weekly/3" do
    assert {:ok, %{"Time Series (Digital Currency Weekly)" => _data}} =
             Cryptocurrencies.weekly("BTC", "USD")
  end

  test "monthly/3" do
    assert {:ok, %{"Time Series (Digital Currency Monthly)" => _data}} =
             Cryptocurrencies.monthly("BTC", "USD")
  end
end
