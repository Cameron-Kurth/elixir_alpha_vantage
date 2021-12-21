defmodule AlphaVantage.EconomicIndicatorsTest do
  use ExUnit.Case
  alias AlphaVantage.EconomicIndicators

  test "real_gdp/1" do
    assert {:ok, %{"name" => "Real Gross Domestic Product"}} = EconomicIndicators.real_gdp()
  end

  test "real_gdp_per_capita/1" do
    assert {:ok, %{"name" => "Real Gross Domestic Product per Capita"}} =
             EconomicIndicators.real_gdp_per_capita()
  end

  test "treasury_yield/1" do
    assert {:ok, %{"name" => "10-Year Treasury Constant Maturity Rate"}} =
             EconomicIndicators.treasury_yield()
  end

  test "interest_rate/1" do
    assert {:ok, %{"name" => "Effective Federal Funds Rate"}} = EconomicIndicators.interest_rate()
  end

  test "cpi/1" do
    assert {:ok, %{"name" => "Consumer Price Index for all Urban Consumers"}} =
             EconomicIndicators.cpi()
  end

  test "inflation/1" do
    assert {:ok, %{"name" => "Inflation - US Consumer Prices"}} = EconomicIndicators.inflation()
  end

  test "inflation_expectation/1" do
    assert {:ok, %{"name" => "Inflation Expectations"}} =
             EconomicIndicators.inflation_expectation()
  end

  test "consumer_sentiment/1" do
    assert {:ok, %{"name" => "Consumer Sentiment & Consumer Confidence"}} =
             EconomicIndicators.consumer_sentiment()
  end

  test "retail_sales/1" do
    assert {:ok, %{"name" => "Advance Retail Sales: Retail Trade"}} =
             EconomicIndicators.retail_sales()
  end

  test "durable_goods/1" do
    assert {:ok, %{"name" => "Manufacturer New Orders: Durable Goods"}} =
             EconomicIndicators.durable_goods()
  end

  test "unemployment_rate/1" do
    assert {:ok, %{"name" => "Unemployment Rate"}} = EconomicIndicators.unemployment_rate()
  end

  test "nonfarm_payroll/1" do
    assert {:ok, %{"name" => "Total Nonfarm Payroll"}} = EconomicIndicators.nonfarm_payroll()
  end
end
