defmodule AlphaVantage.Error do
  @moduledoc """
  A struct which represents an error that occurred during an Alpha Vantage API call.

  It is important to note that Alpha Vantage will return some error payloads inside a 200 response.

  It contains the following fields:
  - `:body` – the raw HTTP response body
  - `:status_code` – the HTTP response status code (e.g., 401)
  """
  defstruct [:body, :status_code]

  @type t :: %__MODULE__{
          body: String.t(),
          status_code: integer()
        }

  @doc false
  @spec new(HTTPoison.Response.t()) :: t()
  def new(%HTTPoison.Response{status_code: status_code, body: body}) do
    new(body, status_code)
  end

  @doc false
  @spec new(String.t(), integer()) :: t()
  def new(body, status_code) do
    struct(AlphaVantage.Error, %{body: body, status_code: status_code})
  end
end
