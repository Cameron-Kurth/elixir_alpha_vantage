defmodule AlphaVantageTest do
  use ExUnit.Case

  describe "query/1" do
    test "with invalid params returns {:error, message}" do
      assert {:error, _message} = AlphaVantage.query(function: "GLOBAL_QUOTE", s: "AAPL")
    end

    test "with valid params returns {:ok, map}" do
      assert {:ok, %{"Global Quote" => global_quote}} =
               AlphaVantage.query(function: "GLOBAL_QUOTE", symbol: "AAPL")

      assert is_map(global_quote)
    end

    test "with valid params and csv datatype param returns {:ok, csv_string}" do
      assert {:ok, global_quote} =
               AlphaVantage.query(function: "GLOBAL_QUOTE", symbol: "AAPL", datatype: "csv")

      assert is_binary(global_quote)
      assert String.contains?("latestDay")
    end

    test "with valid params and json datatype param returns {:ok, json_string}" do
      assert {:ok, global_quote} =
               AlphaVantage.query(function: "GLOBAL_QUOTE", symbol: "AAPL", datatype: "json")

      assert %{"Global Quote" => global_quote} = Jason.decode!(global_quote)
      assert is_map(global_quote)
    end
  end
end
