defmodule AlphaVantage.SectorPerformances do
  @moduledoc """
  A set of functions for fetching sector performance data from [Alpha Vantage](www.alphavantage.co/documentation/#sector-information).
  """

  @doc """

  Returns the realtime and historical sector performances calculated from S&P500 incumbents.
  Please reference https://www.alphavantage.co/documentation/#sector for more detail.

  ## Parameters

  _Optional_ (accepted as a keyword list)

  - `:datatype`

    By default, `datatype: "map"`.
    Strings `"map"` and `"json"` are accepted with the following specifications:
    - `"map"` returns a map;
    - `"json"` returns JSON format;

    *Please note that `"map"` will return unsorted. Also, `"csv"` and thus, `"lists"`, are not yet supported by Alpha Vantage for this function.

  """
  @spec sector(List.t()) :: {:atom, Map.t()} | {:atom, List.t()} | {:atom, String.t()}
  def sector(opts \\ []) do
    params = [function: "SECTOR"]
    AlphaVantage.query(Keyword.merge(params, opts))
  end
end
