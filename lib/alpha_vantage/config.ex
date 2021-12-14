defmodule AlphaVantage.Config do
  @moduledoc false

  @url "https://www.alphavantage.co/query"

  @param_keys [
    :acceleration,
    :adjusted,
    :apikey,
    :datatype,
    :fastdmatype,
    :fastdperiod,
    :fastkperiod,
    :fastlimit,
    :fastmatype,
    :fastperiod,
    :from_currency,
    :from_symbol,
    :function,
    :interval,
    :keywords,
    :market,
    :matype,
    :maximum,
    :nbdevup,
    :nbdevdn,
    :outputsize,
    :series_type,
    :signalmatype,
    :signalperiod,
    :slowdmatype,
    :slowdperiod,
    :slowkmatype,
    :slowkperiod,
    :slowlimit,
    :slowmatype,
    :slowperiod,
    :symbol,
    :time_period,
    :timeperiod1,
    :timeperiod2,
    :timeperiod3,
    :to_currency,
    :to_symbol
  ]

  @time_series_functions [
    "TIME_SERIES_INTRADAY",
    "TIME_SERIES_DAILY",
    "TIME_SERIES_DAILY_ADJUSTED",
    "TIME_SERIES_WEEKLY",
    "TIME_SERIES_WEEKLY_ADJUSTED",
    "TIME_SERIES_MONTHLY",
    "TIME_SERIES_MONTHLY_ADJUSTED",
    "GLOBAL_QUOTE",
    "SYMBOL_SEARCH"
  ]

  @forex_functions [
    "CURRENCY_EXCHANGE_RATE",
    "FX_INTRADAY",
    "FX_DAILY",
    "FX_WEEKLY",
    "FX_MONTHLY"
  ]

  @crypto_functions [
    "CURRENCY_EXCHANGE_RATE",
    "CRYPTO_RATING",
    "CRYPTO_INTRADAY",
    "DIGITAL_CURRENCY_DAILY",
    "DIGITAL_CURRENCY_WEEKLY",
    "DIGITAL_CURRENCY_MONTHLY"
  ]

  @technical_indicator_functions [
    "SMA",
    "EMA",
    "WMA",
    "DEMA",
    "TEMA",
    "TRIMA",
    "KAMA",
    "MAMA",
    "T3",
    "MACD",
    "MACDEXT",
    "STOCH",
    "STOCHF",
    "RSI",
    "STOCHRSI",
    "WILLR",
    "ADX",
    "ADXR",
    "APO",
    "PPO",
    "MOM",
    "BOP",
    "CCI",
    "CMO",
    "ROC",
    "ROCR",
    "AROON",
    "AROONOSC",
    "MFI",
    "TRIX",
    "ULTOSC",
    "DX",
    "MINUS_DI",
    "PLUS_DI",
    "MINUS_DM",
    "PLUS_DM",
    "BBANDS",
    "MIDPOINT",
    "MIDPRICE",
    "SAR",
    "TRANGE",
    "ATR",
    "NATR",
    "AD",
    "ADOSC",
    "OBV",
    "HT_TRENDLINE",
    "HT_SINE",
    "HT_TRENDMODE",
    "HT_DCPERIOD",
    "HT_DCPHASE",
    "HT_PHASOR"
  ]

  @intervals [
    "1min",
    "5min",
    "15min",
    "30min",
    "60min",
    "daily",
    "weekly",
    "monthly"
  ]

  @series_types [
    "close",
    "open",
    "high",
    "low"
  ]

  def url(), do: @url
  def param_keys(), do: @param_keys

  def functions(),
    do:
      @time_series_functions ++
        @forex_functions ++ @crypto_functions ++ @technical_indicator_functions

  def intervals(), do: @intervals
  def series_types(), do: @series_types
end
