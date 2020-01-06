defmodule AlphaVantageTest do
  use ExUnit.Case

  test "query function should return {:ok, map}" do
    {:ok, response} = AlphaVantage.query(function: "GLOBAL_QUOTE", symbol: "DJIA")

    assert is_map(response) == true
  end
end
