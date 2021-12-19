defmodule AlphaVantage.Gateway do
  @moduledoc """
  Interface to the AlphaVantage API (https://www.alphavantage.co/documentation).
  """

  @url "https://www.alphavantage.co/query"

  @type response ::
          {:ok, payload :: map()}
          | {:error, :params, message :: String.t()}
          | {:error, :authentication, message :: String.t()}
          | {:error, :server_error, status_code :: integer()}
          | {:error, :timeout}
          | {:error, any()}

  @spec query(Keyword.t() | map) :: {:error, String.t()} | {:ok, map} | {:ok, String.t()}
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

    HTTPoison.get(@url, [], params: params, recv_timeout: recv_timeout())
    |> handle_response(datatype)
  end

  defp handle_response(response, datatype) do
    case response do
      {:ok, %{status_code: 200, body: body}} ->
        handle_payload(body, datatype)

      {_, %{status_code: 400, body: body}} ->
        {:error, :params, body}

      {_, %{status_code: 401, body: body}} ->
        {:error, :authentication, body}

      {_, %{status_code: status_code}} when status_code in 500..599 ->
        {:error, :server_error, status_code}

      {_, %{reason: :timeout}} ->
        {:error, :timeout}

      {_, response} ->
        {:error, response}
    end
  end

  defp handle_payload(response_body, datatype) do
    case String.contains?(response_body, "Error Message") do
      true -> {:error, Jason.decode!(response_body)["Error Message"]}
      false -> {:ok, decode!(response_body, datatype)}
    end
  end

  # Decodes the query response to match the :datatype option passed to query/1.
  defp decode!(response_body, datatype) when is_atom(datatype) do
    decode!(response_body, Atom.to_string(datatype))
  end

  defp decode!(response_body, datatype) do
    case datatype do
      "csv" ->
        response_body

      "json" ->
        response_body

      "map" ->
        response_body
        |> Jason.decode()
        |> case do
          {:error, _} -> response_body
          {:ok, decoded_response_body} -> decoded_response_body
        end
    end
  end

  defp api_key(), do: Application.get_env(:alpha_vantage, :api_key)
  defp recv_timeout(), do: Application.get_env(:alpha_vantage, :recv_timeout)
end
