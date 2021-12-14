# Alpha Vantage

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Hex version badge](https://img.shields.io/hexpm/v/alpha_vantage.svg)](https://hex.pm/packages/alpha_vantage)

A lightweight Elixir wrapper for the [Alpha Vantage API](https://www.alphavantage.co/).

## Installation

Add :alpha_vantage to your depency list in the `mix.exs` file.

```elixir
def deps do
  [
    {:alpha_vantage, "~> 0.1"}
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

Note that certain requests to the Alpha Vantage API regularly take longer than HTTPoison's default timeout of 500ms, hence the configurability for a higher tolerance.

## Usage

The modules and their respective functions and naming conventions within this library are meant to mirror the Alpha Vantage API documentation as closely as possible for easy cross-referencing and implementation. The only major divergence from this approach is the `AlphaVantage.query/1` function described immediately below.

### Query

The intent of `query/1` is to provide a method for end-users to more flexibly compose their queries to the Alpha Vantage API, similarly to building the URL by hand. The primary benefit of this is the ability to quickly implement new functions from Alpha Vantage that might not yet be implemented in this library.

Parameters, both required and optional, may be passed as keyword lists.
```elixir
iex> AlphaVantage.query(function: "GLOBAL_QUOTE", symbol: "DJIA", datatype: "csv")
{:ok,
 "symbol,open,high,low,price,volume,latestDay,previousClose,change,changePercent\r\nDJIA,28553.3301,28716.3105,28500.3594,28634.8809,239590000,2020-01-03,28868.8008,-233.9199,-0.8103%\r\n"}
```

Note: this method will inform you if invalid parameters are passed.
```elixir
iex> AlphaVantage.query(function: "QUOTE", symbol: "DJIA", datatype: "csv")
{:error, "Invalid function 'QUOTE'."}
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

### Stock Time Series
Functions within the `AlphaVantage.StockTimeSeries` module will accept required parameter values as individual arguments, along with optional parameters as a keyword list.
```elixir
iex> AlphaVantage.StockTimeSeries.monthly("DJIA", datatype: "json")
{:ok,
 "{\n    \"Meta Data\": {\n        \"1. Information\": \"Monthly Prices (open, high, low, close) and Volumes\",\n        \"2. Symbol\": \"DJIA\",\n        \"3. Last Refreshed\": \"2020-01-03\",\n        \"4. Time Zone\": \"US/Eastern\"\n    },\n    \"Monthly Time Series\": {\n        \"2020-01-03\": {\n            \"1. open\": \"28638.9707\",\n            \"2. high\": \"28872.8008\",\n            \"3. low\": \"10000.0000\",\n            \"4. close\": \"28634.8809\",\n            \"5. volume\": \"491410000\"\n        },\n        \"2019-12-31\": {\n            \"1. open\": \"28109.7402\",\n            \"2. high\": \"28701.6602\",\n            \"3. low\": \"27325.1309\",\n            \"4. close\": \"28538.4395\",\n            \"5. volume\": \"5086880000\"\n        },\n        \"2019-11-29\": {\n            \"1. open\": \"27142.9492\",\n            \"2. high\": \"28174.9707\",\n            \"3. low\": \"27142.9492\",\n            \"4. close\": \"28051.4102\",\n            \"5. volume\": \"4925180000\"\n        },\n        \"2019-10-31\": {\n            \"1. open\": \"26962.5391\",\n            \"2. high\": \"27204.3594\",\n            \"3. low\": \"25743.4609\",\n            \"4. close\": \"27046.2305\",\n            \"5. volume\": \"5658040000\"\n        },\n        \"2019-09-30\": {\n            \"1. open\": \"26198.2598\",\n            \"2. high\": \"27306.7305\",\n            \"3. low\": \"25978.2207\",\n            \"4. close\": \"26916.8301\",\n            \"5. volume\": \"5045520000\"\n        },\n        \"2019-08-30\": {\n            \"1. open\": \"26879.8594\",\n            \"2. high\": \"27175.5898\",\n            \"3. low\": \"25339.5996\",\n            \"4. close\": \"26403.2793\",\n            \"5. volume\": \"8170730000\"\n        },\n        \"2019-07-31\": {\n            \"1. open\": \"26805.8594\",\n            \"2. high\": \"27398.6797\",\n            \"3. low\": \"26616.2109\",\n            \"4. close\": \"26864.2695\",\n            \"5. volume\": \"5199240000\"\n        },\n        \"2019-06-28\": {\n            \"1. open\": \"24830.1602\",\n            \"2. high\": \"26907.3691\",\n            \"3. low\": \"24680.5703\",\n            \"4. close\": \"26599.9609\",\n            \"5. volume\": \"5544390000\"\n        },\n        \"2019-05-31\": {\n            \"1. open\": \"26639.0605\",\n            \"2. high\": \"26689.3906\",\n            \"3. low\": \"24809.5098\",\n            \"4. close\": \"24815.0391\",\n            \"5. volume\": \"6358230000\"\n        },\n        \"2019-04-30\": {\n            \"1. open\": \"26075.0996\",\n            \"2. high\": \"26695.9609\",\n            \"3. low\": \"26062.5898\",\n            \"4. close\": \"26592.9102\",\n            \"5. volume\": \"5854600000\"\n        },\n        \"2019-03-29\": {\n            \"1. open\": \"26019.6699\",\n            \"2. high\": \"26155.9805\",\n            \"3. low\": \"25208.0000\",\n            \"4. close\": \"25928.6797\",\n            \"5. volume\": \"6734060000\"\n        },\n        \"2019-02-28\": {\n            \"1. open\": \"25025.3105\",\n            \"2. high\": \"26241.4199\",\n            \"3. low\": \"24883.0391\",\n            \"4. close\": \"25916.0000\",\n            \"5. volume\": \"5434540000\"\n        },\n        \"2019-01-31\": {\n            \"1. open\": \"23058.6094\",\n            \"2. high\": \"25109.6191\",\n            \"3. low\": \"22638.4102\",\n            \"4. close\": \"24999.6699\",\n            \"5. volume\": \"7189200000\"\n        },\n        \"2018-12-31\": {\n            \"1. open\": \"25779.5703\",\n            \"2. high\": \"25980.2109\",\n            \"3. low\": \"21712.5293\",\n            \"4. close\": \"23327.4609\",\n            \"5. volume\": \"8101540000\"\n        },\n        \"2018-11-30\": {\n            \"1. open\": \"25142.0801\",\n            \"2. high\": \"26277.8203\",\n            \"3. low\": \"24268.7402\",\n            \"4. close\": \"25538.4609\",\n            \"5. volume\": \"7226940000\"\n        },\n        \"2018-10-31\": {\n            \"1. open\": \"26598.3594\",\n            \"2. high\": \"26951.8105\",\n            \"3. low\": \"24122.2305\",\n            \"4. close\": \"25115.7598\",\n            \"5. volume\": \"8373350000\"\n        },\n        \"2018-09-28\": {\n            \"1. open\": \"25916.0703\",\n            \"2. high\": \"26769.1602\",\n            \"3. low\": \"25754.3203\",\n            \"4. close\": \"26458.3105\",\n            \"5. volume\": \"5262500000\"\n        },\n        \"2018-08-31\": {\n            \"1. open\": \"25461.6309\",\n            \"2. high\": \"26167.93" <> ...}
 ```

### Forex (FX)
Functions within the `AlphaVantage.Forex` module will accept required parameter values as individual arguments, along with optional parameters as a keyword list.
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

### Cryptocurrencies
Functions within the `AlphaVantage.Cryptocurrencies` module will accept required parameter values as individual arguments, along with optional parameters as a keyword list.
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

### Technical Indicators
Functions within the `AlphaVantage.TechnicalIndicators` module will accept required parameter values as individual arguments, along with optional parameters as a keyword list.
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

### Sector Performances
Functions within the `AlphaVantage.SectorPerformances` module will accept required parameter values as individual arguments, along with optional parameters as a keyword list.
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

Currently, the API key limitations have resulted in very little test coverage. Hopefully, we will be able to resolve this in the near future. In the meantime, please open issues for any problems encountered and we will look to address as promptly as possible.

## Contributing

Contributions are welcome and much appreciated, particularly as we try to keep up with new features from Alpha Vantage. Please feel free to open an issue in advance of any work to confirm that any new features are not already being accounted for or to more generally discuss updates prior to implementation.
