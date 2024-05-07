defmodule AlphaVantage.TechnicalIndicatorsTest do
  use ExUnit.Case
  alias AlphaVantage.TechnicalIndicators

  test "sma/5" do
    assert {:ok, %{"Technical Analysis: SMA" => _data}} =
             TechnicalIndicators.sma("AAPL", "monthly", 6, "close")
  end

  test "ema/5" do
    assert {:ok, %{"Technical Analysis: EMA" => _data}} =
             TechnicalIndicators.ema("AAPL", "monthly", 6, "close")
  end

  test "wma/5" do
    assert {:ok, %{"Technical Analysis: WMA" => _data}} =
             TechnicalIndicators.wma("AAPL", "monthly", 6, "close")
  end

  test "dema/5" do
    assert {:ok, %{"Technical Analysis: DEMA" => _data}} =
             TechnicalIndicators.dema("AAPL", "monthly", 6, "close")
  end

  test "tema/5" do
    assert {:ok, %{"Technical Analysis: TEMA" => _data}} =
             TechnicalIndicators.tema("AAPL", "monthly", 6, "close")
  end

  test "trima/5" do
    assert {:ok, %{"Technical Analysis: TRIMA" => _data}} =
             TechnicalIndicators.trima("AAPL", "monthly", 6, "close")
  end

  test "kama/5" do
    assert {:ok, %{"Technical Analysis: KAMA" => _data}} =
             TechnicalIndicators.kama("AAPL", "monthly", 6, "close")
  end

  test "mama/5" do
    assert {:ok, %{"Technical Analysis: MAMA" => _data}} =
             TechnicalIndicators.mama("AAPL", "monthly", 6, "close")
  end

  test "vwap/3" do
    assert {:ok, %{"Technical Analysis: VWAP" => _data}} =
             TechnicalIndicators.vwap("AAPL", "60min")
  end

  test "t3/5" do
    assert {:ok, %{"Technical Analysis: T3" => _data}} =
             TechnicalIndicators.t3("AAPL", "monthly", 6, "close")
  end

  test "macd/5" do
    assert {:ok, %{"Technical Analysis: MACD" => _data}} =
             TechnicalIndicators.macd("AAPL", "monthly", 6, "close")
  end

  test "macdext/5" do
    assert {:ok, %{"Technical Analysis: MACDEXT" => _data}} =
             TechnicalIndicators.macdext("AAPL", "monthly", 6, "close")
  end

  test "stoch/3" do
    assert {:ok, %{"Technical Analysis: STOCH" => _data}} =
             TechnicalIndicators.stoch("AAPL", "monthly")
  end

  test "stochf/3" do
    assert {:ok, %{"Technical Analysis: STOCHF" => _data}} =
             TechnicalIndicators.stochf("AAPL", "monthly")
  end

  test "rsi/5" do
    assert {:ok, %{"Technical Analysis: RSI" => _data}} =
             TechnicalIndicators.rsi("AAPL", "monthly", 6, "close")
  end

  test "stochrsi/5" do
    assert {:ok, %{"Technical Analysis: STOCHRSI" => _data}} =
             TechnicalIndicators.stochrsi("AAPL", "monthly", 6, "close")
  end

  test "willr/4" do
    assert {:ok, %{"Technical Analysis: WILLR" => _data}} =
             TechnicalIndicators.willr("AAPL", "monthly", 6)
  end

  test "adx/4" do
    assert {:ok, %{"Technical Analysis: ADX" => _data}} =
             TechnicalIndicators.adx("AAPL", "monthly", 6)
  end

  test "adxr/4" do
    assert {:ok, %{"Technical Analysis: ADXR" => _data}} =
             TechnicalIndicators.adxr("AAPL", "monthly", 6)
  end

  test "apo/4" do
    assert {:ok, %{"Technical Analysis: APO" => _data}} =
             TechnicalIndicators.apo("AAPL", "monthly", 6)
  end

  test "ppo/4" do
    assert {:ok, %{"Technical Analysis: PPO" => _data}} =
             TechnicalIndicators.ppo("AAPL", "monthly", "close")
  end

  test "mom/5" do
    assert {:ok, %{"Technical Analysis: MOM" => _data}} =
             TechnicalIndicators.mom("AAPL", "monthly", 6, "close")
  end

  test "bop/3" do
    assert {:ok, %{"Technical Analysis: BOP" => _data}} =
             TechnicalIndicators.bop("AAPL", "monthly")
  end

  test "cci/4" do
    assert {:ok, %{"Technical Analysis: CCI" => _data}} =
             TechnicalIndicators.cci("AAPL", "monthly", 6)
  end

  test "cmo/5" do
    assert {:ok, %{"Technical Analysis: CMO" => _data}} =
             TechnicalIndicators.cmo("AAPL", "monthly", 6, "close")
  end

  test "roc/5" do
    assert {:ok, %{"Technical Analysis: ROC" => _data}} =
             TechnicalIndicators.roc("AAPL", "monthly", 6, "close")
  end

  test "rocr/5" do
    assert {:ok, %{"Technical Analysis: ROCR" => _data}} =
             TechnicalIndicators.rocr("AAPL", "monthly", 6, "close")
  end

  test "aroon/4" do
    assert {:ok, %{"Technical Analysis: AROON" => _data}} =
             TechnicalIndicators.aroon("AAPL", "monthly", 6)
  end

  test "aroonosc/4" do
    assert {:ok, %{"Technical Analysis: AROONOSC" => _data}} =
             TechnicalIndicators.aroonosc("AAPL", "monthly", 6)
  end

  test "mfi/4" do
    assert {:ok, %{"Technical Analysis: MFI" => _data}} =
             TechnicalIndicators.mfi("AAPL", "monthly", 6)
  end

  test "trix/5" do
    assert {:ok, %{"Technical Analysis: TRIX" => _data}} =
             TechnicalIndicators.trix("AAPL", "monthly", 6, "close")
  end

  test "ultosc/3" do
    assert {:ok, %{"Technical Analysis: ULTOSC" => _data}} =
             TechnicalIndicators.ultosc("AAPL", "monthly")
  end

  test "dx/3" do
    assert {:ok, %{"Technical Analysis: DX" => _data}} =
             TechnicalIndicators.dx("AAPL", "monthly", 6)
  end

  test "minus_di/4" do
    assert {:ok, %{"Technical Analysis: MINUS_DI" => _data}} =
             TechnicalIndicators.minus_di("AAPL", "monthly", 6)
  end

  test "plus_di/3" do
    assert {:ok, %{"Technical Analysis: PLUS_DI" => _data}} =
             TechnicalIndicators.plus_di("AAPL", "monthly", 6)
  end

  test "minus_dm/4" do
    assert {:ok, %{"Technical Analysis: MINUS_DM" => _data}} =
             TechnicalIndicators.minus_dm("AAPL", "monthly", 6)
  end

  test "plus_dm/4" do
    assert {:ok, %{"Technical Analysis: PLUS_DM" => _data}} =
             TechnicalIndicators.plus_dm("AAPL", "monthly", 6)
  end

  test "bbands/5" do
    assert {:ok, %{"Technical Analysis: BBANDS" => _data}} =
             TechnicalIndicators.bbands("AAPL", "monthly", 6, "close")
  end

  test "midpoint/5" do
    assert {:ok, %{"Technical Analysis: MIDPOINT" => _data}} =
             TechnicalIndicators.midpoint("AAPL", "monthly", 6, "close")
  end

  test "midprice/4" do
    assert {:ok, %{"Technical Analysis: MIDPRICE" => _data}} =
             TechnicalIndicators.midprice("AAPL", "monthly", 6)
  end

  test "sar/3" do
    assert {:ok, %{"Technical Analysis: SAR" => _data}} =
             TechnicalIndicators.sar("AAPL", "monthly")
  end

  test "trange/3" do
    assert {:ok, %{"Technical Analysis: TRANGE" => _data}} =
             TechnicalIndicators.trange("AAPL", "monthly")
  end

  test "atr/4" do
    assert {:ok, %{"Technical Analysis: ATR" => _data}} =
             TechnicalIndicators.atr("AAPL", "monthly", 6)
  end

  test "natr/4" do
    assert {:ok, %{"Technical Analysis: NATR" => _data}} =
             TechnicalIndicators.natr("AAPL", "monthly", 6)
  end

  test "ad/3" do
    assert {:ok, %{"Technical Analysis: Chaikin A/D" => _data}} =
             TechnicalIndicators.ad("AAPL", "monthly")
  end

  test "adosc/3" do
    assert {:ok, %{"Technical Analysis: ADOSC" => _data}} =
             TechnicalIndicators.adosc("AAPL", "monthly")
  end

  test "obv/3" do
    assert {:ok, %{"Technical Analysis: OBV" => _data}} =
             TechnicalIndicators.obv("AAPL", "monthly")
  end

  test "ht_trendline/4" do
    assert {:ok, %{"Technical Analysis: HT_TRENDLINE" => _data}} =
             TechnicalIndicators.ht_trendline("AAPL", "monthly", "close")
  end

  test "ht_sine/4" do
    assert {:ok, %{"Technical Analysis: HT_SINE" => _data}} =
             TechnicalIndicators.ht_sine("AAPL", "monthly", "close")
  end

  test "ht_trendmode/4" do
    assert {:ok, %{"Technical Analysis: HT_TRENDMODE" => _data}} =
             TechnicalIndicators.ht_trendmode("AAPL", "monthly", "close")
  end

  test "ht_dcperiod/4" do
    assert {:ok, %{"Technical Analysis: HT_DCPERIOD" => _data}} =
             TechnicalIndicators.ht_dcperiod("AAPL", "monthly", "close")
  end

  test "ht_dcphase/4" do
    assert {:ok, %{"Technical Analysis: HT_DCPHASE" => _data}} =
             TechnicalIndicators.ht_dcphase("AAPL", "monthly", "close")
  end

  test "ht_phasor/4" do
    assert {:ok, %{"Technical Analysis: HT_PHASOR" => _data}} =
             TechnicalIndicators.ht_phasor("AAPL", "monthly", "close")
  end
end
