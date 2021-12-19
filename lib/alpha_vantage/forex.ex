defmodule AlphaVantage.Forex do
  @moduledoc """
  A set of functions for fetching forex (FX) rates from [Alpha Vantage](www.alphavantage.co/documentation/#fx).
  """

  @doc """

  Returns the realtime exchange rate for any pair of digital currency (e.g., Bitcoin) and physical currency (e.g., USD).
  Data returned for physical currency (Forex) pairs also include realtime bid and ask prices.
  Please reference https://www.alphavantage.co/documentation/#currency-exchange for more detail.

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

    *Please note that `"csv"` and is not yet supported by Alpha Vantage for this function.

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

  Returns the intraday time series (timestamp, open, high, low, close) of the FX currency pair specified, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#fx-intraday for more detail.

  ## Parameters

  **Required**

  - `:from_symbol`

    The currency you would like to get the exchange rate for. It can either be a physical currency or digital/crypto currency.
    For example: `"USD"`, `"EUR"`, or `"BTC"`

  - `:to_symbol`

    The destination currency for the exchange rate. It can either be a physical currency or digital/crypto currency.
    For example: `"USD"`, `"EUR"`, or `"BTC"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:output_size`

    By default, `outputsize: "compact"`. Strings compact and full are accepted with the following specifications:
    `"compact"` returns only the latest 100 data points in the intraday time series;
    `"full"` returns the full-length intraday time series.
    The `"compact"` option is recommended if you would like to reduce the data size of each API call.

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  - `:outputsize`

    By default, `outputsize: "compact"`.
    Strings `"compact"` and `"full"` are accepted with the following specifications:
    - `"compact"` returns only the latest 100 data points in the intraday time series;
    - `"full"` returns the full-length intraday time series.
    The `"compact"` option is recommended if you would like to reduce the data size of each API call.

  """
  @spec intraday(String.t(), String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def intraday(from_symbol, to_symbol, interval, opts \\ []) do
    params = [
      function: "FX_INTRADAY",
      from_symbol: from_symbol,
      to_symbol: to_symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the daily time series (timestamp, open, high, low, close) of the FX currency pair specified, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#fx-daily for more detail.

  ## Parameters

  **Required**

  - `:from_currency`

    The currency you would like to get the exchange rate for. It can either be a physical currency or digital/crypto currency.
    For example: `"USD"`, `"EUR"`, or `"BTC"`

  - `:to_currency`

    The destination currency for the exchange rate. It can either be a physical currency or digital/crypto currency.
    For example: `"USD"`, `"EUR"`, or `"BTC"`

  _Optional_ (accepted as a keyword list)

  - `:output_size`

    By default, `outputsize: "compact"`. Strings compact and full are accepted with the following specifications:
    `"compact"` returns only the latest 100 data points in the intraday time series;
    `"full"` returns the full-length intraday time series.
    The `"compact"` option is recommended if you would like to reduce the data size of each API call.

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  - `:outputsize`

    By default, `outputsize: "compact"`.
    Strings `"compact"` and `"full"` are accepted with the following specifications:
    - `"compact"` returns only the latest 100 data points in the intraday time series;
    - `"full"` returns the full-length intraday time series.
    The `"compact"` option is recommended if you would like to reduce the data size of each API call.

  """
  @spec daily(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def daily(from_symbol, to_symbol, opts \\ []) do
    params = [function: "FX_DAILY", from_symbol: from_symbol, to_symbol: to_symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the weekly time series (timestamp, open, high, low, close) of the FX currency pair specified, updated realtime.
  The latest data point is the prices information for the week (or partial week) containing the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#fx-weekly for more detail.

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
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec weekly(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def weekly(from_symbol, to_symbol, opts \\ []) do
    params = [function: "FX_WEEKLY", from_symbol: from_symbol, to_symbol: to_symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly time series (timestamp, open, high, low, close) of the FX currency pair specified, updated realtime.
  The latest data point is the prices information for the month (or partial month) containing the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#fx-monthly for more detail.

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
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec monthly(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def monthly(from_symbol, to_symbol, opts \\ []) do
    params = [function: "FX_MONTHLY", from_symbol: from_symbol, to_symbol: to_symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end
end
