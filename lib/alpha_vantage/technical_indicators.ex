defmodule AlphaVantage.TechnicalIndicators do
  @moduledoc """
  A set of functions for fetching technical indicators from [Alpha Vantage](www.alphavantage.co/documentation/#technical-indicators).
  """

  @doc """

  Returns the simple moving average (SMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#sma for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec sma(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def sma(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "SMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the exponential moving average (EMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#ema for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ema(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ema(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "EMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the weighted moving average (WMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#wma for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec wma(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def wma(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "WMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the double exponential moving average (DEMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#dema for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec dema(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def dema(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "DEMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the triple exponential moving average (TEMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#tema for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec tema(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def tema(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "TEMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the triangular moving average (TRIMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#trima for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec trima(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def trima(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "TRIMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Kaufman adaptive moving average (KAMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#kama for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec kama(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def kama(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "KAMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the MESA adaptive moving average (MAMA) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#mama for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec mama(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def mama(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "MAMA",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the volume weighted average price (VWAP) for intraday time series given a symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#vwap for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec vwap(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def vwap(symbol, interval, opts \\ []) do
    params = [
      function: "VWAP",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the triple exponential moving average (T3) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#t3 for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec t3(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def t3(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "T3",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the moving average convergence / divergence (MACD) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#macd for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:fastperiod`

    Positive integers are accepted. By default, `fastperiod: 12`.

  - `:slowperiod`

    Positive integers are accepted. By default, `slowperiod: 26`.

  - `:signalperiod`

    Positive integers are accepted. By default, `signalperiod: 9`.

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec macd(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def macd(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "MACD",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the moving average convergence / divergence values with controllable moving average type (MACDEXT) for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#macdext for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:fastperiod`

    Positive integers are accepted. By default, `fastperiod: 12`.

  - `:slowperiod`

    Positive integers are accepted. By default, `slowperiod: 26`.

  - `:signalperiod`

    Positive integers are accepted. By default, `signalperiod: 9`.

  - `:fastmatype`

    Moving average type for the faster moving average.
    By default, `fastmatype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:slowmatype`

    Moving average type for the slower moving average.
    By default, `slowmatype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:signalmatype`

    Moving average type for the signal moving average.
    By default, `signalmatype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec macdext(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def macdext(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "MACDEXT",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the stochastic oscillator (STOCH) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#stoch for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:fastkperiod`

    The time period of the fastk moving average. Positive integers are accepted. By default, `fastkperiod: 5`.

  - `:slowkperiod`

    The time period of the slowk moving average. Positive integers are accepted. By default, `slowkperiod: 3`.

  - `:slowdperiod`

    The time period of the slowd moving average. Positive integers are accepted. By default, `slowdperiod: 3`.

  - `:slowkmatype`

    Moving average type for the slowk moving average.
    By default, `slowkmatype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:slowdmatype`

    Moving average type for the slowd moving average.
    By default, `slowdmatype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec stoch(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def stoch(symbol, interval, opts \\ []) do
    params = [
      function: "STOCH",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the stochastic fast (STOCHF) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#stochf for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:fastkperiod`

    The time period of the fastk moving average. Positive integers are accepted. By default, `fastkperiod: 5`.

  - `:fastdperiod`

    The time period of the fastd moving average. Positive integers are accepted. By default, `fastdperiod: 3`.

  - `:fastdmatype`

    Moving average type for the fastd moving average.
    By default, `fastdmatype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec stochf(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def stochf(symbol, interval, opts \\ []) do
    params = [
      function: "STOCHF",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the relative strength index (RSI) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#rsi for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec rsi(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def rsi(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "RSI",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the stochastic relative strength index (STOCHRSI) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#stochrsi for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:fastkperiod`

    The time period of the fastk moving average. Positive integers are accepted. By default, `fastkperiod: 5`.

  - `:fastdperiod`

    The time period of the fastd moving average. Positive integers are accepted. By default, `fastdperiod: 3`.

  - `:fastdmatype`

    Moving average type for the fastd moving average.
    By default, `fastdmatype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec stochrsi(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def stochrsi(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "STOCHRSI",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Williams' %R (WILLR) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#willr for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec willr(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def willr(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "WILLR",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the average directional movement index (ADX) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#adx for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec adx(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def adx(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "ADX",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the average directional movement index rating (ADXR) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#adxr for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec adxr(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def adxr(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "ADXR",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the absolute price oscillator (APO) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#apo for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:fastperiod`

    Positive integers are accepted. By default, `fastperiod: 12`.

  - `:slowperiod`

    Positive integers are accepted. By default, `slowperiod: 26`.

  - `:matype`

    Moving average type.
    By default, `matype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec apo(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def apo(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "APO",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the percentage price oscillator (PPO) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#ppo for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:fastperiod`

    Positive integers are accepted. By default, `fastperiod: 12`.

  - `:slowperiod`

    Positive integers are accepted. By default, `slowperiod: 26`.

  - `:matype`

    Moving average type.
    By default, `matype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ppo(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ppo(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "PPO",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the momentum (MOM) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#mom for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec mom(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def mom(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "MOM",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the balance of power (BOP) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#bop for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec bop(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def bop(symbol, interval, opts \\ []) do
    params = [
      function: "BOP",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the commodity channel index (CCI) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#cci for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec cci(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def cci(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "CCI",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Chande momentum oscillator (CMO) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#cmo for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec cmo(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def cmo(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "CMO",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the rate of change (ROC) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#roc for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec roc(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def roc(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "ROC",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the rate of change ratio (ROCR) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#rocr for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec rocr(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def rocr(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "ROCR",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Aroon (AROON) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#aroon for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec aroon(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def aroon(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "AROON",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Aroon oscillator (AROONOSC) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#aroonosc for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec aroonosc(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def aroonosc(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "AROONOSC",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the money flow index (MFI) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#mfi for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec mfi(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def mfi(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "MFI",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the 1-day rate of change of a triple smooth exponential moving average (TRIX) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#trix for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec trix(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def trix(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "TRIX",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the ultimate oscillator (ULTOSC) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#ultosc for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:timeperiod1`

    The first time period for the indicator.
    Positive integers are accepted. By default, `timeperiod1: 7`.

  - `:timeperiod2`

    The second time period for the indicator.
    Positive integers are accepted. By default, `timeperiod1: 14`.

  - `:timeperiod3`

    The third time period for the indicator.
    Positive integers are accepted. By default, `timeperiod1: 28`.

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ultosc(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ultosc(symbol, interval, opts \\ []) do
    params = [
      function: "ULTOSC",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the directional movement index (DX) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#ex for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec dx(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def dx(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "DX",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the minus directional indicator (MINUS_DI) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#minusdi for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec minus_di(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def minus_di(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "MINUS_DI",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the plus directional indicator (PLUS_DI) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#plusdi for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec plus_di(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def plus_di(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "PLUS_DI",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the minus directional movement (MINUS_DM) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#minusdm for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec minus_dm(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def minus_dm(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "MINUS_DM",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the plus directional movement (PLUS_DM) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#plusdm for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec plus_dm(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def plus_dm(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "PLUS_DM",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Bollinger bands (BBANDS) values for a given symbol, interval, time period, and series type.
  Please reference https://www.alphavantage.co/documentation/#bbands for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:nbdevup`

    The standard deviation multiplier of the upper band.
    Positive integers are accepted. By default, `nbdevup: 2`.

  - `:nbdevdn`

    The standard deviation multiplier of the lower band.
    Positive integers are accepted. By default, `nbdevdn: 2`.

  - `:matype`

    Moving average type of the time series.
    By default, `matype: 0`. Integers 0 - 8 are accepted with the following mappings. 0 = Simple Moving Average (SMA), 1 = Exponential Moving Average (EMA), 2 = Weighted Moving Average (WMA), 3 = Double Exponential Moving Average (DEMA), 4 = Triple Exponential Moving Average (TEMA), 5 = Triangular Moving Average (TRIMA), 6 = T3 Moving Average, 7 = Kaufman Adaptive Moving Average (KAMA), 8 = MESA Adaptive Moving Average (MAMA).

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec bbands(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def bbands(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "BBANDS",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the midpoint (MIDPOINT) values for a given symbol, interval, time period, and series type.
  MIDPOINT = (highest value + lowest value)/2.
  Please reference https://www.alphavantage.co/documentation/#midpoint for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec midpoint(String.t(), String.t(), integer(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def midpoint(symbol, interval, time_period, series_type, opts \\ []) do
    params = [
      function: "MIDPOINT",
      symbol: symbol,
      interval: interval,
      time_period: time_period,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the midprice (MIDPRICE) values for a given symbol, interval, and time period.
  MIDPRICE = (highest value + lowest value)/2.
  Please reference https://www.alphavantage.co/documentation/#midpoint for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec midprice(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def midprice(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "MIDPRICE",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the parabolic SAR (SAR) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#sar for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:acceleration`

    The acceleration factor.
    Positive floats are accepted. By default, `acceleration: 0.01`.

  - `:maximum`

    The acceleration factor maximum value.
    Positive floats are accepted. By default, `maximum: 0.20`.

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec sar(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def sar(symbol, interval, opts \\ []) do
    params = [
      function: "SAR",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the true range (TRANGE) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#trange for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec trange(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def trange(symbol, interval, opts \\ []) do
    params = [
      function: "TRANGE",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the average true range (ATR) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#atr for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec atr(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def atr(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "ATR",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the normalized average true range (NATR) values for a given symbol, interval, and time period.
  Please reference https://www.alphavantage.co/documentation/#natr for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:time_period`

    Number of data points used to calculate each moving average value.
    Positive integers are accepted: (e.g., `60`, `200`)

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec natr(String.t(), String.t(), integer(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def natr(symbol, interval, time_period, opts \\ []) do
    params = [
      function: "NATR",
      symbol: symbol,
      interval: interval,
      time_period: time_period
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Chaikin A/D line (AD) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#ad for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ad(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ad(symbol, interval, opts \\ []) do
    params = [
      function: "AD",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Chaikin A/D line oscillator (ADOSC) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#adosc for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:fastperiod`

    The time period of the fast EMA.
    Positive integers are accepted. By default, `fastperiod: 3`.

  - `:slowperiod`

    The time period of the slow EMA.
    Positive integers are accepted. By default, `slowperiod: 10`.

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec adosc(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def adosc(symbol, interval, opts \\ []) do
    params = [
      function: "ADOSC",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the on balance volume (OBV) values for a given symbol and interval.
  Please reference https://www.alphavantage.co/documentation/#obv for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec obv(String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def obv(symbol, interval, opts \\ []) do
    params = [
      function: "OBV",
      symbol: symbol,
      interval: interval
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Hilbert transform, instantaneous trendline (HT_TRENDLINE) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#httrendline for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ht_trendline(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ht_trendline(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "HT_TRENDLINE",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Hilbert transform, sine wave (HT_SINE) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#htsine for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ht_sine(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ht_sine(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "HT_SINE",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Hilbert transform, trend vs cycle mode (HT_TRENDMODE) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#httrendmode for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ht_trendmode(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ht_trendmode(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "HT_TRENDMODE",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Hilbert transform, dominant cycle period (HT_DCPERIOD) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#htdcperiod more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ht_dcperiod(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ht_dcperiod(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "HT_DCPERIOD",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Hilbert transform, dominant cycle phase (HT_DCPHASE) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#htdcphase more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ht_dcphase(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ht_dcphase(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "HT_DCPHASE",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the Hilbert transform, phasor components (HT_PHASOR) values for a given symbol, interval, and series type.
  Please reference https://www.alphavantage.co/documentation/#htphasor more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:interval`

    Time interval between two consecutive data points in the time series.
    The following values are supported and accepted as strings: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"60min"`, `"daily"`, `"weekly"`, `"monthly"`

  - `:series_type`

    The desired price type in the time series.
    Four types are supported and accepted as strings: `"close"`, `"open"`, `"high"`, `"low"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"`, `lists`, `"json"`, and `"csv"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"lists"` returns a list of lists;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file.

    *Please note that `"map"` and `"lists"` will both return unsorted.

  """
  @spec ht_phasor(String.t(), String.t(), String.t(), list()) ::
          {:atom, map()} | {:atom, list()} | {:atom, String.t()}
  def ht_phasor(symbol, interval, series_type, opts \\ []) do
    params = [
      function: "HT_PHASOR",
      symbol: symbol,
      interval: interval,
      series_type: series_type
    ]

    AlphaVantage.query(Keyword.merge(params, opts))
  end
end
