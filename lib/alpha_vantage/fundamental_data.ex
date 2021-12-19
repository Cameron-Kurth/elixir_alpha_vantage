defmodule AlphaVantage.FundamentalData do
  @moduledoc """
  A set of functions for fetching various temporal dimensions covering key financial metrics, income statements, balance sheets, cash flow, and other fundamental data points from [Alpha Vantage](www.alphavantage.co/documentation/#fundamentals).
  """

  @doc """

  Returns the annual and quarterly income statements for the company of interest, with normalized fields mapped to GAAP and IFRS taxonomies of the SEC.
  Data is generally refreshed on the same day a company reports its latest earnings and financials.
  Please reference https://www.alphavantage.co/documentation/#income-statement for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"` and `"json"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec income_statement(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def income_statement(symbol, opts \\ []) do
    params = [function: "INCOME_STATEMENT", symbol: symbol]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the annual and quarterly balance sheets for the company of interest, with normalized fields mapped to GAAP and IFRS taxonomies of the SEC.
  Data is generally refreshed on the same day a company reports its latest earnings and financials.
  Please reference https://www.alphavantage.co/documentation/#balance-sheet for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"` and `"json"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec balance_sheet(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def balance_sheet(symbol, opts \\ []) do
    params = [function: "BALANCE_SHEET", symbol: symbol]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns This API returns the annual and quarterly cash flow for the company of interest, with normalized fields mapped to GAAP and IFRS taxonomies of the SEC.
  Data is generally refreshed on the same day a company reports its latest earnings and financials.
  Please reference https://www.alphavantage.co/documentation/#cash-flow for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"` and `"json"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec cash_flow(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def cash_flow(symbol, opts \\ []) do
    params = [function: "CASH_FLOW", symbol: symbol]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the annual and quarterly earnings (EPS) for the company of interest.
  Quarterly data also includes analyst estimates and surprise metrics.
  Please reference https://www.alphavantage.co/documentation/#earnings for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"` and `"json"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec earnings(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def earnings(symbol, opts \\ []) do
    params = [function: "EARNINGS", symbol: symbol]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the company information, financial ratios, and other key metrics for the equity specified.
  Data is generally refreshed on the same day a company reports its latest earnings and financials.
  Please reference https://www.alphavantage.co/documentation/#company-overview for more detail.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"` and `"json"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec company_overview(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def company_overview(symbol, opts \\ []) do
    params = [function: "OVERVIEW", symbol: symbol]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns a list of active or delisted US stocks and ETFs, either as of the latest trading day or at a specific time in history.
  The endpoint is positioned to facilitate equity research on asset lifecycle and survivorship.
  Please reference https://www.alphavantage.co/documentation/#listing-status for more detail.

  Note: To ensure optimal API response time, this endpoint uses the CSV format which is more memory-efficient than JSON.

  ## Parameters

  **Required**

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  _Optional_ (accepted as a keyword list)

  - `:date`

    If no date is set, the API endpoint will return a list of active or delisted symbols as of the latest trading day.
    If a date is set, the API endpoint will "travel back" in time and return a list of active or delisted symbols on that particular date in history.
    Any YYYY-MM-DD date later than 2010-01-01 is supported. For example, `date: "2013-08-03"`.

  - `:state`

    By default, `state: "active"` and the API will return a list of actively traded stocks and ETFs.
    Set `state: "delisted"` to query a list of delisted assets.

  """
  @spec listing_status(String.t(), Keyword.t()) ::
          {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def listing_status(symbol, opts \\ []) do
    params = [function: "LISTING_STATUS", symbol: symbol]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns a list of company earnings expected in the next 3, 6, or 12 months.
  Please reference https://www.alphavantage.co/documentation/#earnings-calendar for more detail.

  Note: To ensure optimal API response time, this endpoint uses the CSV format which is more memory-efficient than JSON.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:symbol`

    The name of the security of your choice, provided as a string.
    For example: `"MSFT"`

  - `:horizon`

    By default, `horizon: "3month"` and the API will return a list of expected company earnings in the next 3 months.
    You may set `horizon: "6month"` or `horizon: "12month"` to query the earnings scheduled for the next 6 months or 12 months, respectively.

  """
  @spec earnings_calendar(Keyword.t()) :: {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def earnings_calendar(opts \\ []) do
    params = [function: "EARNINGS_CALENDAR"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns a list of IPOs expected in the next 3 months.
  Please reference https://www.alphavantage.co/documentation/#ipo-calendar for more detail.

  Note: To ensure optimal API response time, this endpoint uses the CSV format which is more memory-efficient than JSON.

  """
  @spec ipo_calendar(Keyword.t()) :: {:error, String.t()} | {:ok, map} | {:ok, String.t()}
  def ipo_calendar(opts \\ []) do
    params = [function: "IPO_CALENDAR"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end
end
