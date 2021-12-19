defmodule AlphaVantage.EconomicIndicators do
  @moduledoc """
  A set of functions for key US economic indicators from [Alpha Vantage](www.alphavantage.co/documentation/#economic-indicators).
  """

  alias AlphaVantage.Gateway

  @doc """

  Returns the annual and quarterly Real GDP of the United States.

  Please reference https://www.alphavantage.co/documentation/#real-gdp for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  - `:interval`
    - `"quarterly"`
    - `"annual"` (default)

  """
  @spec real_gdp(Keyword.t()) :: Gateway.response()
  def real_gdp(opts \\ []) do
    params = [function: "REAL_GDP"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the quarterly Real GDP per Capita data of the United States.

  Please reference https://www.alphavantage.co/documentation/#real-gdp-per-capita for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec real_gdp_per_capita(Keyword.t()) :: Gateway.response()
  def real_gdp_per_capita(opts \\ []) do
    params = [function: "REAL_GDP_PER_CAPITA"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the daily, weekly, and monthly US treasury yield of a given maturity timeline (e.g., 5 year, 30 year, etc).

  Please reference https://www.alphavantage.co/documentation/#treasury-yield for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  - `:interval`
    - `"quarterly"`
    - `"annual"` (default)

  - `:maturity`
    - `"3month"`
    - `"5year"`
    - `"10year"` (default)
    - `"30year"`

  """
  @spec treasury_yield(Keyword.t()) :: Gateway.response()
  def treasury_yield(opts \\ []) do
    params = [function: "TREASURY_YIELD"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the daily, weekly, and monthly federal funds rate (interest rate) of the United States.

  Please reference https://www.alphavantage.co/documentation/#interest-rate for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  - `:interval`
    - `"daily"`
    - `"weekly"`
    - `"monthly"` (default)

  """
  @spec interest_rate(Keyword.t()) :: Gateway.response()
  def interest_rate(opts \\ []) do
    params = [function: "FEDERAL_FUNDS_RATE"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly and semiannual consumer price index (CPI) of the United States.

  Please reference https://www.alphavantage.co/documentation/#cpi for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  - `:interval`
    - `"monthly"` (default)
    - `"semiannual"`

  """
  @spec cpi(Keyword.t()) :: Gateway.response()
  def cpi(opts \\ []) do
    params = [function: "CPI"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the annual inflation rates (consumer prices) of the United States.

  Please reference https://www.alphavantage.co/documentation/#inflation for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec inflation(Keyword.t()) :: Gateway.response()
  def inflation(opts \\ []) do
    params = [function: "INFLATION"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly inflation expectation data of the United States, as measured by the median expected price change next 12 months according to the Surveys of Consumers by University of Michigan (Inflation Expectation© [MICH]), retrieved from FRED, Federal Reserve Bank of St. Louis.

  Please reference https://www.alphavantage.co/documentation/#inflation-expectation for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec inflation_expectation(Keyword.t()) :: Gateway.response()
  def inflation_expectation(opts \\ []) do
    params = [function: "INFLATION_EXPECTATION"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly consumer sentiment and confidence data of the United States, as measured by the Surveys of Consumers by University of Michigan (Consumer Sentiment © [UMCSENT]), retrieved from FRED, Federal Reserve Bank of St. Louis.

  Please reference https://www.alphavantage.co/documentation/#consumer-sentiment for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec consumer_sentiment(Keyword.t()) :: Gateway.response()
  def consumer_sentiment(opts \\ []) do
    params = [function: "CONSUMER_SENTIMENT"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly Advance Retail Sales: Retail Trade data of the United States.

  Please reference https://www.alphavantage.co/documentation/#retail-sales for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec retail_sales(Keyword.t()) :: Gateway.response()
  def retail_sales(opts \\ []) do
    params = [function: "RETAIL_SALES"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly manufacturers' new orders of durable goods in the United States.

  Please reference https://www.alphavantage.co/documentation/#durable-goods for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec durable_goods(Keyword.t()) :: Gateway.response()
  def durable_goods(opts \\ []) do
    params = [function: "DURABLES"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly unemployment data of the United States.
  The unemployment rate represents the number of unemployed as a percentage of the labor force. Labor force data are restricted to people 16 years of age and older, who currently reside in 1 of the 50 states or the District of Columbia, who do not reside in institutions (e.g., penal and mental facilities, homes for the aged), and who are not on active duty in the Armed Forces.

  Please reference https://www.alphavantage.co/documentation/#unemployment for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec unemployment_rate(Keyword.t()) :: Gateway.response()
  def unemployment_rate(opts \\ []) do
    params = [function: "UNEMPLOYMENT"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end

  @doc """

  Returns the monthly US All Employees: Total Nonfarm (commonly known as Total Nonfarm Payroll), a measure of the number of U.S. workers in the economy that excludes proprietors, private household employees, unpaid volunteers, farm employees, and the unincorporated self-employed.

  Please reference https://www.alphavantage.co/documentation/#nonfarm-payroll for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`
    - `"map"` returns a map (default);
    - `"json"` returns JSON format;
    - `"csv"` returns a CSV (comma separated value) file string.

  """
  @spec nonfarm_payroll(Keyword.t()) :: Gateway.response()
  def nonfarm_payroll(opts \\ []) do
    params = [function: "NONFARM_PAYROLL"]

    AlphaVantage.query(Keyword.merge(params, opts))
  end
end
