defmodule AlphaVantage.FundamentalDataTest do
  use ExUnit.Case
  alias AlphaVantage.FundamentalData

  test "income_statement/2" do
    assert {:ok, %{"annualReports" => _income_statments, "symbol" => "AAPL"}} =
             FundamentalData.income_statement("AAPL")
  end

  test "balance_sheet/2" do
    assert {:ok, %{"annualReports" => _balance_sheets, "symbol" => "AAPL"}} =
             FundamentalData.balance_sheet("AAPL")
  end

  test "cash_flow/2" do
    assert {:ok, %{"annualReports" => _cash_flows, "symbol" => "AAPL"}} =
             FundamentalData.cash_flow("AAPL")
  end

  test "earnings/2" do
    assert {:ok, %{"annualEarnings" => _earnings, "symbol" => "AAPL"}} =
             FundamentalData.earnings("AAPL")
  end

  test "company_overview/2" do
    assert {:ok, %{"Name" => _name, "Description" => _description, "Symbol" => "AAPL"}} =
             FundamentalData.company_overview("AAPL")
  end

  test "listing_status/2" do
    assert {:ok, csv_string} = FundamentalData.listing_status("AAPL")
    assert is_binary(csv_string)
  end

  test "earnings_calendar/1" do
    assert {:ok, csv_string} = FundamentalData.earnings_calendar()
    assert is_binary(csv_string)
    assert String.contains?(csv_string, "reportDate")
  end

  test "ipo_calendar/1" do
    assert {:ok, csv_string} = FundamentalData.ipo_calendar()
    assert is_binary(csv_string)
    assert String.contains?(csv_string, "ipoDate")
  end
end
