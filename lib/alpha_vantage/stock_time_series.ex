defmodule AlphaVantage.StockTimeSeries do
  @moduledoc """
  A set of functions for fetching realtime and historical global equity data from [Alpha Vantage](www.alphavantage.co/documentation/#time-series-data) in 4 different temporal resolutions:
  (1) daily, (2) weekly, (3) monthly, and (4) intraday.
  Daily, weekly, and monthly time series contain 20+ years of historical data.
  """

  @doc """

  Returns intraday time series (timestamp, open, high, low, close, volume) of the equity specified.
  Please reference https://www.alphavantage.co/documentation/#intraday for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

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
  @spec intraday(String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def intraday(symbol, interval, opts \\ []) do
    params = [function: "TIME_SERIES_INTRADAY", symbol: symbol, interval: interval]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns historical intraday time series for the trailing 2 years, covering over 2 million data points per ticker.
  The intraday data is derived from the Securities Information Processor (SIP) market-aggregated data.
  You can query both raw (as-traded) and split/dividend-adjusted intraday data from this endpoint.
  Common use cases for this API include data visualization, trading simulation/backtesting, and machine learning and deep learning applications with a longer horizon.
  Please reference https://www.alphavantage.co/documentation/#intraday-extended for more detail.

  Note: To ensure optimal API response time, this endpoint uses the CSV format which is more memory-efficient than JSON.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:slice`

    Two years of minute-level intraday data contains over 2 million data points, which can take up to Gigabytes of memory.
    To ensure optimal API response speed, the trailing 2 years of intraday data is evenly divided into 24 "slices" - `"year1month1"`, `"year1month2"`, `"year1month3"`, ..., `"year1month11"`, `"year1month12"`, `"year2month1"`, `"year2month2"`, `"year2month3"`, ..., `"year2month11"`, `"year2month12"`.
    Each slice is a 30-day window, with `"year1month1"` being the most recent and `"year2month12"` being the farthest from today.
    By default, `slice: "year1month1"`.

  _Optional_ (accepted as a keyword list)

  - `:adjusted`

    By default, `adjusted: true` and the output time series is adjusted by historical split and dividend events.
    Set `adjusted: false` to query raw (as-traded) intraday values.

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec intraday_extended_history(String.t(), String.t(), String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def intraday_extended_history(symbol, interval, slice, opts \\ []) do
    params = [
      function: "TIME_SERIES_INTRADAY_EXTENDED",
      symbol: symbol,
      interval: interval,
      slice: slice,
      datatype: "csv"
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns daily time series (date, daily open, daily high, daily low, daily close, daily volume) of the global equity specified, covering 20+ years of historical data.
  The most recent data point is the prices and volume information of the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#daily for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

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

  """
  @spec daily(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def daily(symbol, opts \\ []) do
    params = [function: "TIME_SERIES_DAILY", symbol: symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns daily time series (date, daily open, daily high, daily low, daily close, daily volume, daily adjusted close, and split/dividend events) of the global equity specified, covering 20+ years of historical data.
  The most recent data point is the prices and volume information of the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#dailyadj for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

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
  @spec daily_adjusted(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def daily_adjusted(symbol, opts \\ []) do
    params = [function: "TIME_SERIES_DAILY_ADJUSTED", symbol: symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns weekly time series (last trading day of each week, weekly open, weekly high, weekly low, weekly close, weekly volume) of the global equity specified, covering 20+ years of historical data.
  The latest data point is the prices and volume information for the week (or partial week) that contains the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#weekly for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

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
  @spec weekly(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def weekly(symbol, opts \\ []) do
    params = [function: "TIME_SERIES_WEEKLY", symbol: symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns weekly adjusted time series (last trading day of each week, weekly open, weekly high, weekly low, weekly close, weekly adjusted close, weekly volume, weekly dividend) of the global equity specified, covering 20+ years of historical data.
  The latest data point is the prices and volume information for the week (or partial week) that contains the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#weeklyadj for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec weekly_adjusted(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def weekly_adjusted(symbol, opts \\ []) do
    params = [function: "TIME_SERIES_WEEKLY_ADJUSTED", symbol: symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns monthly time series (last trading day of each month, monthly open, monthly high, monthly low, monthly close, monthly volume) of the global equity specified, covering 20+ years of historical data.
  The latest data point is the prices and volume information for the month (or partial month) that contains the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#monthly for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec monthly(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def monthly(symbol, opts \\ []) do
    params = [function: "TIME_SERIES_MONTHLY", symbol: symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns monthly adjusted time series (last trading day of each month, monthly open, monthly high, monthly low, monthly close, monthly adjusted close, monthly volume, monthly dividend) of the equity specified, covering 20+ years of historical data.
  The latest data point is the prices and volume information for the month (or partial month) that contains the current trading day, updated realtime.
  Please reference https://www.alphavantage.co/documentation/#monthlyadj for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec monthly_adjusted(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def monthly_adjusted(symbol, opts \\ []) do
    params = [function: "TIME_SERIES_MONTHLY_ADJUSTED", symbol: symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the latest price and volume information for a security of your choice.
  Please reference https://www.alphavantage.co/documentation/#latestprice for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec quote(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def quote(symbol, opts \\ []) do
    params = [function: "GLOBAL_QUOTE", symbol: symbol]
    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the best-matching symbols and market information based on keywords of your choice.
  The search results also contain match scores that provide you with the full flexibility to develop your own search and filtering logic.
  Please reference https://www.alphavantage.co/documentation/#symbolsearch for more detail.

  ## Parameters

  **Required**

  - `:keywords`

    A text string of your choice.
    For example: keywords=`"microsoft"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec search(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def search(keywords, opts \\ []) do
    params = [function: "SYMBOL_SEARCH", keywords: keywords]
    AlphaVantage.query(Keyword.merge(params, opts))
  end
end
