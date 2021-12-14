defmodule AlphaVantage.Cryptocurrencies do
  @moduledoc """
  A set of functions for fetching cryptocurrency data from [Alpha Vantage](www.alphavantage.co/documentation/#digital-currency).
  """

  @doc """

  Returns the realtime exchange rate for any pair of digital currency (e.g., Bitcoin) and physical currency (e.g., USD).
  Data returned for physical currency (Forex) pairs also include realtime bid and ask prices.
  Please reference https://www.alphavantage.co/documentation/#crypto-exchange for more detail.

  ## Parameters

  **Required**

  - `:from_currency`

    The currency you would like to get the exchange rate for. It can either be a physical currency or digital/crypto currency.
    For example: `"USD"`, `"EUR"`, or `"BTC"`

  - `:to_currency`

    The destination currency for the exchange rate. It can either be a physical currency or digital/crypto currency.
    For example: `"USD"`, `"EUR"`, or `"BTC"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"` and `"json"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;

    *Please note that `"csv"` is not yet supported by Alpha Vantage for this function.

  """
  @spec exchange_rate(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def exchange_rate(from_currency, to_currency, opts \\ []) do
    params = [
      function: "CURRENCY_EXCHANGE_RATE",
      from_currency: from_currency,
      to_currency: to_currency
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the daily historical time series for a digital currency (e.g., BTC) traded on a specific market (e.g., CNY/Chinese Yuan), refreshed daily at midnight (UTC).
  Prices and volumes are quoted in both the market-specific currency and USD.
  Please reference https://www.alphavantage.co/documentation/#currency-daily for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The digital/crypto currency of your choice.
    It can be any of the currencies in the [digital currency list](https://www.alphavantage.co/digital_currency_list/).
    For example: `"BTC"`

  - `:market`

    The exchange market of your choice.
     It can be any of the market in the [market list](https://www.alphavantage.co/physical_currency_list/).
    For example: `"CNY"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec daily(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def daily(symbol, market, opts \\ []) do
    params = [function: "DIGITAL_CURRENCY_DAILY", symbol: symbol, market: market]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the weekly historical time series for a digital currency (e.g., BTC) traded on a specific market (e.g., CNY/Chinese Yuan), refreshed daily at midnight (UTC).
  Prices and volumes are quoted in both the market-specific currency and USD.
  Please reference https://www.alphavantage.co/documentation/#currency-weekly for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The digital/crypto currency of your choice.
    It can be any of the currencies in the [digital currency list](https://www.alphavantage.co/digital_currency_list/).
    For example: `"BTC"`

  - `:market`

    The exchange market of your choice.
     It can be any of the market in the [market list](https://www.alphavantage.co/physical_currency_list/).
    For example: `"CNY"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec weekly(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def weekly(symbol, market, opts \\ []) do
    params = [function: "DIGITAL_CURRENCY_WEEKLY", symbol: symbol, market: market]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly historical time series for a digital currency (e.g., BTC) traded on a specific market (e.g., CNY/Chinese Yuan), refreshed daily at midnight (UTC).
  Prices and volumes are quoted in both the market-specific currency and USD.
  Please reference https://www.alphavantage.co/documentation/#currency-monthly for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The digital/crypto currency of your choice.
    It can be any of the currencies in the [digital currency list](https://www.alphavantage.co/digital_currency_list/).
    For example: `"BTC"`

  - `:market`

    The exchange market of your choice.
     It can be any of the market in the [market list](https://www.alphavantage.co/physical_currency_list/).
    For example: `"CNY"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec monthly(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def monthly(symbol, market, opts \\ []) do
    params = [function: "DIGITAL_CURRENCY_MONTHLY", symbol: symbol, market: market]
    AlphaVantage.query(Keyword.merge(params, opts))
  end
end
