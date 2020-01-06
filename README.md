# Alpha Vantage

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A lightweight Elixir wrapper for the [Alpha Vantage API](https://www.alphavantage.co/).

## Installation

Add :alpha_vantage to you depency list in the `mix.exs` file.

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
     "2019-12-03 10:30" => %{"EMA" => "308.4310"},
     "2019-12-16 13:30" => %{"EMA" => "319.9795"},
     "2019-12-12 11:00" => %{"EMA" => "317.2844"},
     "2019-11-27 10:30" => %{"EMA" => "314.4720"},
     "2019-11-22 15:30" => %{"EMA" => "310.9453"},
     "2019-12-16 13:00" => %{"EMA" => "319.9986"},
     "2020-01-02 11:00" => %{"EMA" => "323.1884"},
     "2019-12-26 14:00" => %{"EMA" => "322.3173"},
     "2019-12-23 10:00" => %{"EMA" => "321.2199"},
     "2019-12-20 11:30" => %{"EMA" => "321.0219"},
     "2019-11-26 15:00" => %{"EMA" => "313.7687"},
     "2019-12-09 10:00" => %{"EMA" => "314.9233"},
     "2019-12-10 10:30" => %{"EMA" => "314.1457"},
     "2019-11-27 16:00" => %{"EMA" => "315.4131"},
     "2019-12-30 11:00" => %{"EMA" => "321.2261"},
     "2020-01-03 16:00" => %{"EMA" => "322.6082"},
     "2019-12-23 13:30" => %{"EMA" => "321.4669"},
     "2019-12-11 14:30" => %{"EMA" => "314.1254"},
     "2019-11-21 11:00" => %{"EMA" => "310.0108"},
     "2019-12-11 14:00" => %{"EMA" => "313.8561"},
     "2019-11-29 10:00" => %{"EMA" => "315.1244"},
     "2019-12-27 12:00" => %{"EMA" => "323.2738"},
     "2019-12-31 16:00" => %{"EMA" => "321.6764"},
     "2019-12-13 10:00" => %{"EMA" => "317.2309"},
     "2019-12-10 14:30" => %{"EMA" => "313.9189"},
     "2019-12-18 11:30" => %{"EMA" => "320.0755"},
     "2019-12-31 14:00" => %{"EMA" => "320.8476"},
     "2019-12-26 14:30" => %{"EMA" => "322.3058"},
     "2019-12-09 12:30" => %{"EMA" => "314.5933"},
     "2019-12-20 14:30" => %{"EMA" => "321.0702"},
     "2019-12-18 10:30" => %{"EMA" => "319.6397"},
     "2019-12-30 12:00" => %{"EMA" => "321.4322"},
     "2019-11-29 12:30" => %{"EMA" => "314.5524"},
     "2019-12-03 13:00" => %{"EMA" => "308.4064"},
     "2019-12-11 16:00" => %{"EMA" => "314.4169"},
     "2019-12-24 10:30" => %{"EMA" => "321.1817"},
     "2019-12-31 10:30" => %{"EMA" => "320.9355"},
     "2019-12-04 12:00" => %{"EMA" => "311.6475"},
     "2019-12-11 10:00" => %{"EMA" => "314.1642"},
     "2020-01-03 13:00" => %{"EMA" => "323.3417"},
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
     "2017-11-30" => %{
       "1a. open (CNY)" => "45018.02650000",
       "1b. open (USD)" => "6463.00000000",
       "2a. high (CNY)" => "78710.35896500",
       "2b. high (USD)" => "11300.03000000",
       "3a. low (CNY)" => "37091.35715500",
       "3b. low (USD)" => "5325.01000000",
       "4a. close (CNY)" => "68533.27588000",
       "4b. close (USD)" => "9838.96000000",
       "5. volume" => "108487.97811900",
       "6. market cap (USD)" => "108487.97811900"
     },
     "2017-12-31" => %{
       "1a. open (CNY)" => "68519.62350000",
       "1b. open (USD)" => "9837.00000000",
       "2a. high (CNY)" => "137907.70554000",
       "2b. high (USD)" => "19798.68000000",
       "3a. low (CNY)" => "65336.39000000",
       "3b. low (USD)" => "9380.00000000",
       "4a. close (CNY)" => "95541.30558000",
       "4b. close (USD)" => "13716.36000000",
       "5. volume" => "408476.65839900",
       "6. market cap (USD)" => "408476.65839900"
     },
     "2018-01-31" => %{
       "1a. open (CNY)" => "95536.36007500",
       "1b. open (USD)" => "13715.65000000",
       "2a. high (CNY)" => "119641.09972000",
       "2b. high (USD)" => "17176.24000000",
       "3a. low (CNY)" => "62933.29250000",
       "3b. low (USD)" => "9035.00000000",
       "4a. close (CNY)" => "71640.86405000",
       "4b. close (USD)" => "10285.10000000",
       "5. volume" => "816675.56446700",
       "6. market cap (USD)" => "816675.56446700"
     },
     "2018-02-28" => %{
       "1a. open (CNY)" => "71640.86405000",
       "1b. open (USD)" => "10285.10000000",
       "2a. high (CNY)" => "82095.45265500",
       "2b. high (USD)" => "11786.01000000",
       "3a. low (CNY)" => "41793.06965500",
       "3b. low (USD)" => "6000.01000000",
       "4a. close (CNY)" => "71931.04678000",
       "4b. close (USD)" => "10326.76000000",
       "5. volume" => "1243940.85531000",
       "6. market cap (USD)" => "1243940.85531000"
     },
     "2018-03-31" => %{
       "1a. open (CNY)" => "71923.24542000",
       "1b. open (USD)" => "10325.64000000",
       "2a. high (CNY)" => "81566.00500000",
       "2b. high (USD)" => "11710.00000000",
       "3a. low (CNY)" => "45972.99655000",
       "3b. low (USD)" => "6600.10000000",
       "4a. close (CNY)" => "48228.49510500",
       "4b. close (USD)" => "6923.91000000",
       "5. volume" => "1235326.31402000",
       "6. market cap (USD)" => "1235326.31402000"
     },
     "2018-04-30" => %{
       "1a. open (CNY)" => "48215.19100000",
       "1b. open (USD)" => "6922.00000000",
       "2a. high (CNY)" => "67982.02621000",
       "2b. high (USD)" => "9759.82000000",
       "3a. low (CNY)" => "44788.16500000",
       "3b. low (USD)" => "6430.00000000",
       "4a. close (CNY)" => "64403.08265500",
       "4b. close (USD)" => "9246.01000000",
       "5. volume" => "1110964.01558000",
       "6. market cap (USD)" => "1110964.01558000"
     },
     "2018-05-31" => %{
       "1a. open (CNY)" => "64403.08265500",
       "1b. open (USD)" => "9246.01000000",
       "2a. high (CNY)" => "69794.31000000",
       "2b. high (USD)" => "10020.00000000",
       "3a. low (CNY)" => "48988.01322500",
       "3b. low (USD)" => "7032.95000000",
       "4a. close (CNY)" => "52136.83715500",
       "4b. close (USD)" => "7485.01000000",
       "5. volume" => "914476.37788500",
       "6. market cap (USD)" => "914476.37788500"
     },
     "2018-06-30" => %{
       "1a. open (CNY)" => "52136.83715500",
       "1b. open (USD)" => "7485.01000000",
       "2a. high (CNY)" => "54238.18919500",
       "2b. high (USD)" => "7786.69000000",
       "3a. low (CNY)" => "40051.62500000",
       "3b. low (USD)" => "5750.00000000",
       "4a. close (CNY)" => "44510.03258500",
       "4b. close (USD)" => "6390.07000000",
       "5. volume" => "942249.76594400",
       "6. market cap (USD)" => "942249.76594400"
     },
     "2018-07-31" => %{
       "1a. open (CNY)" => "44517.06774000",
       "1b. open (USD)" => "6391.08000000",
       "2a. high (CNY)" => "59149.42393500",
       "2b. high (USD)" => "8491.77000000",
       "3a. low (CNY)" => "42280.58500000",
       "3b. low (USD)" => "6070.00000000",
       "4a. close (CNY)" => "53849.79291500",
       "4b. close (USD)" => "7730.93000000",
       "5. volume" => "1102510.43679000",
       "6. market cap (USD)" => "1102510.43679000"
     },
     "2018-08-31" => %{
       "1a. open (CNY)" => "53882.80938500",
       "1b. open (USD)" => "7735.67000000",
       "2a. high (CNY)" => "53982.62500000",
       "2b. high (USD)" => "7750.00000000",
       "3a. low (CNY)" => "40957.14000000",
       "3b. low (USD)" => "5880.00000000",
       "4a. close (CNY)" => "48836.58325500",
       "4b. close (USD)" => "7011.21000000",
       "5. volume" => "1408159.81656000",
       "6. market cap (USD)" => "1408159.81656000"
     },
     "2018-09-30" => %{
       "1a. open (CNY)" => "48836.58325500",
       "1b. open (USD)" => "7011.21000000",
       "2a. high (CNY)" => "51614.35500000",
       "2b. high (USD)" => "7410.00000000",
       "3a. low (CNY)" => "42566.17050000",
       "3b. low (USD)" => "6111.00000000",
       "4a. close (CNY)" => "46157.37333500",
       "4b. close (USD)" => "6626.57000000",
       "5. volume" => "1100653.42331000",
       "6. market cap (USD)" => "1100653.42331000"
     },
     "2018-10-31" => %{
       "1a. open (CNY)" => "46157.37333500",
       "1b. open (USD)" => "6626.57000000",
       "2a. high (CNY)" => "53495.04000000",
       "2b. high (USD)" => "7680.00000000",
       "3a. low (CNY)" => "43220.92750000",
       "3b. low (USD)" => "6205.00000000",
       "4a. close (CNY)" => "44383.67841500",
       "4b. close (USD)" => "6371.93000000",
       "5. volume" => "629922.08621900",
       "6. market cap (USD)" => "629922.08621900"
     },
     "2018-11-30" => %{
       "1a. open (CNY)" => "44366.89156000",
       "1b. open (USD)" => "6369.52000000",
       "2a. high (CNY)" => "46077.82732500",
       "2b. high (USD)" => "6615.15000000",
       "3a. low (CNY)" => "25442.60323000",
       "3b. low (USD)" => "3652.66000000",
       "4a. close (CNY)" => "28149.81446000",
       "4b. close (USD)" => "4041.32000000",
       "5. volume" => "1210365.44962000",
       "6. market cap (USD)" => "1210365.44962000"
     },
     "2018-12-31" => %{
       "1a. open (CNY)" => "28149.46618500",
       "1b. open (USD)" => "4041.27000000",
       "2a. high (CNY)" => "30042.13184500",
       "2b. high (USD)" => "4312.99000000",
       "3a. low (CNY)" => "21984.92903000",
       "3b. low (USD)" => "3156.26000000",
       "4a. close (CNY)" => "25792.54995000",
       "4b. close (USD)" => "3702.90000000",
       "5. volume" => "1591229.14717000",
       "6. market cap (USD)" => "1591229.14717000"
     },
     "2019-01-31" => %{
       "1a. open (CNY)" => "25780.91756500",
       "1b. open (USD)" => "3701.23000000",
       "2a. high (CNY)" => "28348.19190000",
       "2b. high (USD)" => "4069.80000000",
       "3a. low (CNY)" => "23333.86776000",
       "3b. low (USD)" => "3349.92000000",
       "4a. close (CNY)" => "23920.22355000",
       "4b. close (USD)" => "3434.10000000",
       "5. volume" => "908244.14054000",
       "6. market cap (USD)" => "908244.14054000"
     },
     "2019-02-28" => %{
       "1a. open (CNY)" => "23920.22355000",
       "1b. open (USD)" => "3434.10000000",
       "2a. high (CNY)" => "29241.16900000",
       "2b. high (USD)" => "4198.00000000",
       "3a. low (CNY)" => "23495.32805000",
       "3b. low (USD)" => "3373.10000000",
       "4a. close (CNY)" => "26564.25769500",
       "4b. close (USD)" => "3813.69000000",
       "5. volume" => "861783.98672700",
       "6. market cap (USD)" => "861783.98672700"
     },
     "2019-03-31" => %{
       "1a. open (CNY)" => "26568.22803000",
       "1b. open (USD)" => "3814.26000000",
       "2a. high (CNY)" => "28837.17000000",
       "2b. high (USD)" => "4140.00000000",
       "3a. low (CNY)" => "25568.19119500",
       "3b. low (USD)" => "3670.69000000",
       "4a. close (CNY)" => "28586.06372500",
       "4b. close (USD)" => "4103.95000000",
       "5. volume" => "787190.48925000",
       "6. market cap (USD)" => "787190.48925000"
     },
     "2019-04-30" => %{
       "1a. open (CNY)" => "28575.54582000",
       "1b. open (USD)" => "4102.44000000",
       "2a. high (CNY)" => "39006.80000000",
       "2b. high (USD)" => "5600.00000000",
       "3a. low (CNY)" => "28328.68850000",
       "3b. low (USD)" => "4067.00000000",
       "4a. close (CNY)" => "37062.10205500",
       "4b. close (USD)" => "5320.81000000",
       "5. volume" => "1126961.31510000",
       "6. market cap (USD)" => "1126961.31510000"
     },
     "2019-05-31" => %{
       "1a. open (CNY)" => "37069.97307000",
       "1b. open (USD)" => "5321.94000000",
       "2a. high (CNY)" => "63206.75803000",
       "2b. high (USD)" => "9074.26000000",
       "3a. low (CNY)" => "37029.99110000",
       "3b. low (USD)" => "5316.20000000",
       "4a. close (CNY)" => "59589.85250000",
       "4b. close (USD)" => "8555.00000000",
       "5. volume" => "1498409.89023000",
       "6. market cap (USD)" => "1498409.89023000"
     },
     "2019-06-30" => %{
       "1a. open (CNY)" => "59589.85250000",
       "1b. open (USD)" => "8555.00000000",
       "2a. high (CNY)" => "97308.03500000",
       "2b. high (USD)" => "13970.00000000",
       "3a. low (CNY)" => "51855.22199000",
       "3b. low (USD)" => "7444.58000000",
       "4a. close (CNY)" => "75604.23355000",
       "4b. close (USD)" => "10854.10000000",
       "5. volume" => "1689489.64733000",
       "6. market cap (USD)" => "1689489.64733000"
     },
     "2019-07-31" => %{
       "1a. open (CNY)" => "75604.23355000",
       "1b. open (USD)" => "10854.10000000",
       "2a. high (CNY)" => "91575.98574000",
       "2b. high (USD)" => "13147.08000000",
       "3a. low (CNY)" => "63107.43000000",
       "3b. low (USD)" => "9060.00000000",
       "4a. close (CNY)" => "70215.93171500",
       "4b. close (USD)" => "10080.53000000",
       "5. volume" => "1886176.06591000",
       "6. market cap (USD)" => "1886176.06591000"
     },
     "2019-08-31" => %{
       "1a. open (CNY)" => "70215.93171500",
       "1b. open (USD)" => "10080.53000000",
       "2a. high (CNY)" => "85889.49085000",
       "2b. high (USD)" => "12330.70000000",
       "3a. low (CNY)" => "64918.46000000",
       "3b. low (USD)" => "9320.00000000",
       "4a. close (CNY)" => "66781.52228500",
       "4b. close (USD)" => "9587.47000000",
       "5. volume" => "1201961.57632000",
       "6. market cap (USD)" => "1201961.57632000"
     },
     "2019-09-30" => %{
       "1a. open (CNY)" => "66790.36847000",
       "1b. open (USD)" => "9588.74000000",
       "2a. high (CNY)" => "75964.83748500",
       "2b. high (USD)" => "10905.87000000",
       "3a. low (CNY)" => "53704.00500000",
       "3b. low (USD)" => "7710.00000000",
       "4a. close (CNY)" => "57739.39777000",
       "4b. close (USD)" => "8289.34000000",
       "5. volume" => "1116856.47584000",
       "6. market cap (USD)" => "1116856.47584000"
     },
     "2019-10-31" => %{
       "1a. open (CNY)" => "57743.78603500",
       "1b. open (USD)" => "8289.97000000",
       "2a. high (CNY)" => "72232.23500000",
       "2b. high (USD)" => "10370.00000000",
       "3a. low (CNY)" => "50848.15000000",
       "3b. low (USD)" => "7300.00000000",
       "4a. close (CNY)" => "63670.59067500",
       "4b. close (USD)" => "9140.85000000",
       "5. volume" => "1446755.85472000",
       "6. market cap (USD)" => "1446755.85472000"
     },
     "2019-11-30" => %{
       "1a. open (CNY)" => "63670.66033000",
       "1b. open (USD)" => "9140.86000000",
       "2a. high (CNY)" => "66267.53804000",
       "2b. high (USD)" => "9513.68000000",
       "3a. low (CNY)" => "45380.23250000",
       "3b. low (USD)" => "6515.00000000",
       "4a. close (CNY)" => "52533.03479500",
       "4b. close (USD)" => "7541.89000000",
       "5. volume" => "1499118.77500000",
       "6. market cap (USD)" => "1499118.77500000"
     },
     "2019-12-31" => %{
       "1a. open (CNY)" => "52524.25826500",
       "1b. open (USD)" => "7540.63000000",
       "2a. high (CNY)" => "53982.62500000",
       "2b. high (USD)" => "7750.00000000",
       "3a. low (CNY)" => "44822.99250000",
       "3b. low (USD)" => "6435.00000000",
       "4a. close (CNY)" => "50118.37456500",
       "4b. close (USD)" => "7195.23000000",
       "5. volume" => "1307026.46794000",
       "6. market cap (USD)" => "1307026.46794000"
     },
     "2020-01-05" => %{
       "1a. open (CNY)" => "50118.44422000",
       "1b. open (USD)" => "7195.24000000",
       "2a. high (CNY)" => "52047.19117000",
       "2b. high (USD)" => "7472.14000000",
       "3a. low (CNY)" => "47860.22912000",
       "3b. low (USD)" => "6871.04000000",
       "4a. close (CNY)" => "51872.07850000",
       "4b. close (USD)" => "7447.00000000",
       "5. volume" => "152753.87096700",
       "6. market cap (USD)" => "152753.87096700"
     }
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
     "2017-06-30" => %{"MOM" => "28.2000"},
     "2010-04-30" => %{"MOM" => "72.5900"},
     "2018-11-30" => %{"MOM" => "-8.2900"},
     "2009-01-30" => %{"MOM" => "-68.8200"},
     "2009-05-29" => %{"MOM" => "43.1400"},
     "2004-01-30" => %{"MOM" => "1.4800"},
     "2020-01-03" => %{"MOM" => "84.3900"},
     "2011-04-29" => %{"MOM" => "49.1500"},
     "2018-03-29" => %{"MOM" => "13.6600"},
     "2001-03-30" => %{"MOM" => "-3.6800"},
     "2001-02-28" => %{"MOM" => "-42.6900"},
     "2003-07-31" => %{"MOM" => "6.7200"},
     "2007-03-30" => %{"MOM" => "15.9300"},
     "2013-10-31" => %{"MOM" => "79.9220"},
     "2003-10-31" => %{"MOM" => "8.6700"},
     "2008-03-31" => %{"MOM" => "-9.9700"},
     "2001-04-30" => %{"MOM" => "5.9300"},
     "2008-01-31" => %{"MOM" => "3.6000"},
     "2008-08-29" => %{"MOM" => "44.5100"},
     "2012-07-31" => %{"MOM" => "154.2800"},
     "2018-10-31" => %{"MOM" => "53.6000"},
     "2014-06-30" => %{"MOM" => "-468.0900"},
     "2009-02-27" => %{"MOM" => "-80.2200"},
     "2015-11-30" => %{"MOM" => "-11.9800"},
     "2003-12-31" => %{"MOM" => "2.3100"},
     "2014-08-29" => %{"MOM" => "-423.7400"},
     "2011-11-30" => %{"MOM" => "34.3700"},
     "2014-01-31" => %{"MOM" => "48.0700"},
     "2001-07-31" => %{"MOM" => "-2.8300"},
     "2001-05-31" => %{"MOM" => "3.4500"},
     "2005-03-31" => %{"MOM" => "2.9200"},
     "2005-06-30" => %{"MOM" => "-27.5900"},
     "2007-07-31" => %{"MOM" => "46.0300"},
     "2017-12-29" => %{"MOM" => "25.2100"},
     "2003-09-30" => %{"MOM" => "6.5800"},
     "2000-08-31" => %{"MOM" => "-53.6800"},
     "2014-03-31" => %{"MOM" => "59.9900"},
     "2008-05-30" => %{"MOM" => "6.5300"},
     "2003-06-30" => %{"MOM" => "4.7300"},
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
   "Rank C: 5 Day Performance" => %{
     "Communication Services" => "-0.22%",
     "Consumer Discretionary" => "-0.09%",
     "Consumer Staples" => "-1.06%",
     "Energy" => "0.36%",
     "Financials" => "-0.40%",
     "Health Care" => "-0.96%",
     "Industrials" => "1.10%",
     "Information Technology" => "0.45%",
     "Materials" => "-2.75%",
     "Real Estate" => "0.33%",
     "Utilities" => "-0.55%"
   },
   "Rank D: 1 Month Performance" => %{
     "Communication Services" => "3.58%",
     "Consumer Discretionary" => "3.88%",
     "Consumer Staples" => "0.76%",
     "Energy" => "6.32%",
     "Financials" => "2.98%",
     "Health Care" => "3.21%",
     "Industrials" => "3.19%",
     "Information Technology" => "6.59%",
     "Materials" => "0.86%",
     "Real Estate" => "2.05%",
     "Utilities" => "2.62%"
   },
   "Rank E: 3 Month Performance" => %{
     "Communication Services" => "12.06%",
     "Consumer Discretionary" => "7.28%",
     "Consumer Staples" => "4.01%",
     "Energy" => "10.30%",
     "Financials" => "14.39%",
     "Health Care" => "15.99%",
     "Industrials" => "11.59%",
     "Information Technology" => "18.06%",
     "Materials" => "7.23%",
     "Real Estate" => "-0.32%",
     "Utilities" => "0.29%"
   },
   "Rank F: Year-to-Date (YTD) Performance" => %{
     "Communication Services" => "0.75%",
     "Consumer Discretionary" => "0.43%",
     "Consumer Staples" => "-0.99%",
     "Energy" => "0.51%",
     "Financials" => "-0.17%",
     "Health Care" => "-0.66%",
     "Industrials" => "1.69%",
     "Information Technology" => "0.65%",
     "Materials" => "-2.84%",
     "Real Estate" => "-0.52%", 
     "Utilities" => "-1.27%"
   },
   "Rank G: 1 Year Performance" => %{
     "Communication Services" => "30.24%",
     "Consumer Discretionary" => "25.58%",
     "Consumer Staples" => "23.26%",
     "Energy" => "5.99%",
     "Financials" => "28.01%",
     "Health Care" => "19.51%",
     "Industrials" => "28.39%",
     "Information Technology" => "48.91%",
     "Materials" => "17.87%",
     "Real Estate" => "27.18%",
     "Utilities" => "22.86%"
   },
   "Rank H: 3 Year Performance" => %{
     "Communication Services" => "3.62%",
     "Consumer Discretionary" => "52.90%",
     "Consumer Staples" => "20.45%",
     "Energy" => "-17.26%",
     "Financials" => "32.08%",
     "Health Care" => "48.11%",
     "Industrials" => "29.95%",
     "Information Technology" => "100.72%",
     "Materials" => "20.09%",
     "Real Estate" => "25.67%",
     "Utilities" => "31.34%"
   },
   "Rank I: 5 Year Performance" => %{
     "Communication Services" => "19.34%",
     "Consumer Discretionary" => "74.20%",
     "Consumer Staples" => "28.67%",
     "Energy" => "-22.13%",
     "Financials" => "53.12%",
     "Health Care" => "48.46%",
     "Industrials" => "43.95%",
     "Information Technology" => "134.71%",
     "Materials" => "22.58%",
     "Utilities" => "34.23%"
   },
   "Rank J: 10 Year Performance" => %{
     "Communication Services" => "59.64%",
     "Consumer Discretionary" => "321.36%",
     "Consumer Staples" => "133.52%",
     "Energy" => "6.70%",
     "Financials" => "163.45%",
     "Health Care" => "225.86%",
     "Industrials" => "187.76%",
     "Information Technology" => "337.45%",
     "Materials" => "87.62%",
     "Utilities" => "105.19%"
   }
 }}
```

## A Note on Tests

Currently, the API key limitations have resulted in very little test coverage. Hopefully, we will be able to resolve this in the near future. In the meantime, please open issues for any problems encountered and we will look to address as promptly as possible.

## Contributing

Contributions are welcome and much appreciated, particularly as we try to keep up with new features from Alpha Vantage. Please feel free to open an issue in advance of any work to confirm that any new features are not already being accounted for or to more generally discuss updates prior to implementation.