defmodule AlphaVantage do
  @moduledoc """
  A set of functions to fetch data from the [Alpha Vantage API](https://www.alphavantage.co/documentation/#) in flexible manner, as well as retrieve the valid inputs for the API.
  """
  alias AlphaVantage.Config

  @url Config.url()
  @param_keys Config.param_keys()
  @functions Config.functions()
  @intervals Config.intervals()
  @series_types Config.series_types()

  @doc """

  Returns data per the provided function and inputs, accepted as a keyword list or map.
  Please cite the Alpha Vantage [documentation](https://www.alphavantage.co/documentation/#) for details as to what parameters and options are to be utilized for each function.
  The Cryptocurrenies, Forex, StockTimeSeries, and TechnicalIndicators modules can be leveraged for more structured and explicit inputs, per function.

  """
  @spec query(List.t() | Map.t()) :: {:atom, Map.t()} | {:atom, List.t()} | {:atom, String.t()}
  def query(params \\ [])
  def query(params) when is_map(params), do: params |> Map.to_list() |> query

  def query(params) when is_list(params) do
    recv_timeout = Application.get_env(:alpha_vantage, :recv_timeout)
    datatype = Keyword.get(params, :datatype, "map")

    request_datatype =
      case datatype do
        "map" -> "json"
        "lists" -> "csv"
        _ -> datatype
      end

    params =
      Keyword.put(params, :apikey, Application.get_env(:alpha_vantage, :api_key))
      |> Keyword.put(:datatype, request_datatype)

    cond do
      valid_param_keys?(params) == false ->
        {:error,
         "Invalid parameter key(s) passed. Please verify your parameter list for correctness."}

      valid_function?(params) == false ->
        {:error, "Invalid function '#{Keyword.get(params, :function)}'."}

      valid_interval?(params) == false ->
        {:error, "Invalid interval '#{Keyword.get(params, :interval)}'."}

      valid_series_type?(params) == false ->
        {:error, "Invalid series type '#{Keyword.get(params, :series_type)}'."}

      true ->
        {:ok,
         HTTPoison.get!(@url, [], params: params, recv_timeout: recv_timeout).body
         |> decode!(datatype)}
    end
  end

  @doc """

  Returns the list of parameter keys that are supported by Alpha Vantage.

  """
  @spec get_param_keys() :: List.t()
  def get_param_keys(), do: @param_keys

  # Ensures the parameter keys are supported by Alpha Vantage.
  defp valid_param_keys?(params) do
    Keyword.keys(params)
    |> Enum.all?(fn x -> x in @param_keys end)
  end

  @doc """

  Returns the list of :function values that are supported by Alpha Vantage.

  """
  @spec get_functions() :: List.t()
  def get_functions(), do: @functions

  # Ensures the :function value is supported by Alpha Vantage.
  defp valid_function?(params) do
    Keyword.get(params, :function) in @functions
  end

  @doc """

  Returns the list of :interval values that are supported by Alpha Vantage.

  """
  @spec get_intervals() :: List.t()
  def get_intervals(), do: @intervals

  # Ensures the :interval value is supported by Alpha Vantage.
  defp valid_interval?(params) do
    if Keyword.has_key?(params, :interval) do
      Keyword.get(params, :interval) in @intervals
    else
      true
    end
  end

  @doc """

  Returns the list of :series_type values that are supported by Alpha Vantage.

  """
  @spec get_series_types() :: List.t()
  def get_series_types(), do: @series_types

  # Ensures the :series_type value is supported by Alpha Vantage.
  defp valid_series_type?(params) do
    if Keyword.has_key?(params, :series_type) do
      Keyword.get(params, :series_type) in @series_types
    else
      true
    end
  end

  # Decodes the query response to match the :datatype option passed to query/1.
  defp decode!(response, datatype) when is_atom(datatype) do
    decode!(response, Atom.to_string(datatype))
  end

  defp decode!(response, datatype) do
    case datatype do
      "map" -> Jason.decode!(response)
      "lists" -> NimbleCSV.RFC4180.parse_string(response)
      "json" -> response
      "csv" -> response
    end
  end
end
