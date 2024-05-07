defmodule AlphaVantage.Gateway do
  @moduledoc false

  alias AlphaVantage.Error

  @url "https://www.alphavantage.co/query"

  @type response :: {:ok, map() | String.t()} | {:error, Error.t() | HTTPoison.Error.t()}

  @spec query(Keyword.t() | map()) :: response()
  def query(params) do
    datatype = Keyword.get(params, :datatype, "map")

    request_datatype =
      case datatype do
        "map" -> "json"
        _ -> datatype
      end

    params =
      params
      |> Keyword.put(:apikey, api_key())
      |> Keyword.put(:datatype, request_datatype)

    @url
    |> HTTPoison.get([], params: params, recv_timeout: recv_timeout())
    |> handle_response(datatype)
  end

  defp handle_response(response, datatype) do
    case response do
      {:ok, %{status_code: 200, body: body}} -> handle_payload(body, datatype)
      {:error, %HTTPoison.Error{} = error} -> {:error, error}
      {_, response} -> {:error, Error.new(response)}
    end
  end

  defp handle_payload(body, datatype) do
    cond do
      String.contains?(body, "Error Message") ->
        {:error, Error.new(Jason.decode!(body)["Error Message"], 400)}

      String.contains?(body, "API rate limit") ->
        decoded = Jason.decode!(body)
        error_body = decoded["Note"] || decoded["Information"]
        {:error, Error.new(error_body, 429)}

      true ->
        {:ok, decode!(body, datatype)}
    end
  end

  # Decodes the query response to match the :datatype option passed to query/1.
  defp decode!(response_body, datatype) when is_atom(datatype) do
    decode!(response_body, Atom.to_string(datatype))
  end

  defp decode!(response_body, datatype) do
    case datatype do
      "csv" -> response_body
      "json" -> response_body
      "map" -> Jason.decode!(response_body)
    end
  end

  defp api_key(), do: Application.get_env(:alpha_vantage, :api_key)
  defp recv_timeout(), do: Application.get_env(:alpha_vantage, :recv_timeout)
end
