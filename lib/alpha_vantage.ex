defmodule AlphaVantage do
  @moduledoc """
  A set of functions to fetch data from the [Alpha Vantage API](https://www.alphavantage.co/documentation/#) in flexible manner, as well as retrieve the valid inputs for the API.
  """

  alias AlphaVantage.Gateway

  @doc """

  Returns data per the provided function and inputs, accepted as a keyword list or map.
  Please cite the Alpha Vantage [documentation](https://www.alphavantage.co/documentation/#) for details as to what parameters and options are to be utilized for each function.
  The Cryptocurrenies, Forex, StockTimeSeries, and TechnicalIndicators modules can be leveraged for more structured and explicit inputs, per function.

  """
  @spec query(Keyword.t() | map) :: Gateway.response()
  def query(params \\ [])
  def query(params) when is_map(params), do: params |> Map.to_list() |> query

  def query(params) when is_list(params) do
    Gateway.query(params)
  end

  def query(_), do: {:error, "Invalid query."}
end
