# Alpha Vantage

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Hex version badge](https://img.shields.io/hexpm/v/alpha_vantage.svg)](https://hex.pm/packages/alpha_vantage)

A lightweight Elixir wrapper for the [Alpha Vantage API](https://www.alphavantage.co/).

## Installation

Add `:alpha_vantage` to your depency list in the `mix.exs` file.

```elixir
def deps do
  [
    {:alpha_vantage, "~> 0.2"}
  ]
end
```

You can now run `mix deps.get`.

## Configuration

Within `config.exs` or within the environment specific config files (e.g. `dev.exs`) add your Alpha Vantage API [key](https://www.alphavantage.co/support/#api-key) and set your response timeout threshold.

```elixir
config :alpha_vantage,
  api_key: "YOUR_API_KEY",
  recv_timeout: 5_000
```

Note that certain requests to the Alpha Vantage API regularly take longer than HTTPoison's default timeout of 5000ms, hence the configurability for a higher tolerance.

## Usage

The modules and their respective functions and naming conventions within this library are meant to mirror the Alpha Vantage API documentation as closely as possible for easy cross-referencing and implementation. The only notable divergence from this approach is the `AlphaVantage.query/1` function described immediately below.

### Query

The intent of `query/1` is to provide a method for end-users to more flexibly compose their queries to the Alpha Vantage API, similarly to building the URL by hand. The primary benefit of this is the ability to quickly implement new functions from Alpha Vantage that might not yet be implemented in this library.

Parameters, both required and optional, may be passed as keyword lists.
```elixir
iex> AlphaVantage.query(function: "GLOBAL_QUOTE", symbol: "AAPL")
{:ok,
 %{
   "Global Quote" => %{
     "01. symbol" => "AAPL",
     "02. open" => "182.3540",
     "03. high" => "184.2000",
     "04. low" => "180.4200",
     "05. price" => "181.7100",
     "06. volume" => "76286731",
     "07. latest trading day" => "2024-05-06",
     "08. previous close" => "183.3800",
     "09. change" => "-1.6700",
     "10. change percent" => "-0.9107%"
   }
 }}
```

> [!NOTE]  
> This method will inform you if invalid functions or parameters are passed. Alpha Vantage returns these errors with a 200 status code, but they are cast to a 400 in the `AlphaVantage.Error` struct. Similarly, rate limit errors are cast to a 429 status code.
```elixir
iex> AlphaVantage.query(function: "QUOTE", symbol: "AAPL")
{:error,
 %AlphaVantage.Error{
   body: "This API function (QUOTE) does not exist.",
   status_code: 400
 }}

iex> AlphaVantage.query(function: "GLOBAL_QUOTE", s: "AAPL")
{:error,
 %AlphaVantage.Error{
   body: "Invalid API call. Please retry or visit the documentation (https://www.alphavantage.co/documentation/) for GLOBAL_QUOTE.",
   status_code: 400
 }}
```

Parameters may also be passed as a map.
```elixir
iex> AlphaVantage.query(%{function: "EMA", symbol: "SPY", interval: "30min", time_period: 2, series_type: "close"})
{:ok,
 %{
   "Meta Data" => %{
     "1: Symbol" => "SPY",
     "2: Indicator" => "Exponential Moving Average (EMA)",
     "3: Last Refreshed" => "2020-01-03 16:00:00",
     "4: Interval" => "30min",
     "5: Time Period" => 2,
     "6: Series Type" => "close",
     "7: Time Zone" => "US/Eastern"
   },
   "Technical Analysis: EMA" => %{
     "2019-12-10 10:00" => %{"EMA" => "313.6772"},
     "2019-12-09 12:00" => %{"EMA" => "314.6798"},
     "2019-12-16 15:30" => %{"EMA" => "319.7121"},
     "2019-12-19 11:30" => %{"EMA" => "320.3790"},
     "2019-12-20 10:00" => %{"EMA" => "320.6725"},
     "2019-12-20 13:00" => %{...},
     ...
   }
 }}
```

### Stock Time Series Example
```elixir
iex> AlphaVantage.StockTimeSeries.monthly("AAPL")
{:ok,
 %{
   "Meta Data" => %{
     "1. Information" => "Monthly Prices (open, high, low, close) and Volumes",
     "2. Symbol" => "AAPL",
     "3. Last Refreshed" => "2024-05-06",
     "4. Time Zone" => "US/Eastern"
   },
   "Monthly Time Series" => %{
     "2010-07-30" => %{
       "1. open" => "254.3000",
       "2. high" => "265.9900",
       "3. low" => "239.6000",
       "4. close" => "257.2500",
       "5. volume" => "559632300"
     },
     "2024-02-29" => %{
       "1. open" => "183.9850",
       "2. high" => "191.0500",
       "3. low" => "179.2500",
       "4. close" => "180.7500",
       "5. volume" => "1161711745"
     },
     "2007-10-31" => %{"1. open" => "154.6300", "2. high" => "190.1200", ...},
     "2017-11-30" => %{"1. open" => "169.8700", ...},
     "2017-09-29" => %{...},
     ...
   }
 }}
 ```

### Forex (FX) Example
```elixir
iex> AlphaVantage.Forex.exchange_rate("USD", "CAD")
{:ok,
 %{
   "Realtime Currency Exchange Rate" => %{
     "1. From_Currency Code" => "USD",
     "2. From_Currency Name" => "United States Dollar",
     "3. To_Currency Code" => "CAD",
     "4. To_Currency Name" => "Canadian Dollar",
     "5. Exchange Rate" => "1.30000000",
     "6. Last Refreshed" => "2020-01-05 20:21:01",
     "7. Time Zone" => "UTC",
     "8. Bid Price" => "1.29990000",
     "9. Ask Price" => "1.30010000"
   }
 }}
```

### Cryptocurrencies Example
```elixir
iex> AlphaVantage.Cryptocurrencies.monthly("BTC", "CNY")
{:ok,
 %{
   "Meta Data" => %{
     "1. Information" => "Monthly Prices and Volumes for Digital Currency",
     "2. Digital Currency Code" => "BTC",
     "3. Digital Currency Name" => "Bitcoin",
     "4. Market Code" => "CNY",
     "5. Market Name" => "Chinese Yuan",
     "6. Last Refreshed" => "2020-01-05 00:00:00",
     "7. Time Zone" => "UTC"
   },
   "Time Series (Digital Currency Monthly)" => %{
     "2017-09-30" => %{
       "1a. open (CNY)" => "32667.42879500",
       "1b. open (USD)" => "4689.89000000",
       "2a. high (CNY)" => "34403.92794500",
       "2b. high (USD)" => "4939.19000000",
       "3a. low (CNY)" => "19621.81350000",
       "3b. low (USD)" => "2817.00000000",
       "4a. close (CNY)" => "30498.51140500",
       "4b. close (USD)" => "4378.51000000",
       "5. volume" => "27634.18912000",
       "6. market cap (USD)" => "27634.18912000"
     },
     "2017-10-31" => %{
       "1a. open (CNY)" => "30498.37209500",
       "1b. open (USD)" => "4378.49000000",
       "2a. high (CNY)" => "45261.88865500",
       "2b. high (USD)" => "6498.01000000",
       "3a. low (CNY)" => "28628.20500000",
       "3b. low (USD)" => "4110.00000000",
       "4a. close (CNY)" => "45018.02650000",
       "4b. close (USD)" => "6463.00000000",
       "5. volume" => "41626.38846300",
       "6. market cap (USD)" => "41626.38846300"
     },
     ...
   }
 }}
```

### Technical Indicators Example
```elixir
iex> AlphaVantage.TechnicalIndicators.mom("AAPL", "monthly", 6, "close")
{:ok,
 %{
   "Meta Data" => %{
     "1: Symbol" => "AAPL",
     "2: Indicator" => "Momentum (MOM)",
     "3: Last Refreshed" => "2020-01-03",
     "4: Interval" => "monthly",
     "5: Time Period" => 6,
     "6: Series Type" => "close",
     "7: Time Zone" => "US/Eastern Time"
   },
   "Technical Analysis: MOM" => %{
     "2011-06-30" => %{"MOM" => "13.1100"},
     "2010-06-30" => %{"MOM" => "40.7980"},
     "2006-10-31" => %{"MOM" => "10.6900"},
     "2012-02-29" => %{"MOM" => "157.6100"},
     "2003-02-28" => %{"MOM" => "0.2600"},
     "2011-09-30" => %{"MOM" => "32.8125"},
     "2016-02-29" => %{...},
     ...
   }
 }}
```

### Sector Performances Example
```elixir
iex> AlphaVantage.SectorPerformances.sector()
{:ok,
 %{
   "Meta Data" => %{
     "Information" => "US Sector Performance (realtime & historical)",
     "Last Refreshed" => "2020-01-05 15:14:28 US/Eastern"
   },
   "Rank A: Real-Time Performance" => %{
     "Communication Services" => "-0.55%",
     "Consumer Discretionary" => "-0.85%",
     "Consumer Staples" => "-0.17%",
     "Energy" => "-0.34%",
     "Financials" => "-1.10%",
     "Health Care" => "-0.85%",
     "Industrials" => "-0.12%",
     "Information Technology" => "-1.06%",
     "Materials" => "-1.62%",
     "Real Estate" => "0.81%",
     "Utilities" => "0.11%"
   },
   "Rank B: 1 Day Performance" => %{
     "Communication Services" => "-0.55%",
     "Consumer Discretionary" => "-0.85%",
     "Consumer Staples" => "-0.17%",
     "Energy" => "-0.34%",
     "Financials" => "-1.10%",
     "Health Care" => "-0.85%",
     "Industrials" => "-0.12%",
     "Information Technology" => "-1.06%",
     "Materials" => "-1.62%",
     "Real Estate" => "0.81%",
     "Utilities" => "0.11%"
   },
   ...
 }}
```

## A Note on Tests

Currently, the free API key limitation of 5 requests per minute prevent the test suite from being run in its entirety, so please note that it is often easiest to run specific tests. This is a self-inflicted problem, as calling the API directly for tests was opted for in lieu of mocking responses in order to signal changes to the Alpha Vantage API. This approach is subject to change.

## Contributing

Contributions are welcome and much appreciated, particularly as we try to keep up with new features from Alpha Vantage. Please feel free to open an issue in advance of any work to confirm that any new features are not already being accounted for or to more generally discuss updates prior to implementation.
