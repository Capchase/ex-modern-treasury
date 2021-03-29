defmodule ModernTreasurer do
  @moduledoc """
  Documentation for `ModernTreasurer`.
  """

  @endpoint "https://app.moderntreasury.com/api"

  def get_counterparty(id) do
    path = "/counterparties/#{id}"
    get_request(path)
  end

  def create_counterparty(body) do
    path = "/counterparties/"
    post_request(path, body)
  end

  defp post_request(path, body) do
    url = build_url(path)
    credentials = get_encoded_credentials()
    headers = [Authorization: "Basic #{credentials}", Accept: "Application/json; Charset=utf-8"]
    body = JSON.encode!(body)
    HTTPoison.post(url, body, headers)
  end

  defp get_request(path) do
    url = build_url(path)
    credentials = get_encoded_credentials()
    headers = [Authorization: "Basic #{credentials}", Accept: "Application/json; Charset=utf-8"]
    HTTPoison.get(url, headers)
  end

  defp build_url(path) do
    "#{@endpoint}#{path}"
  end

  defp get_encoded_credentials do
    secret = Application.get_env(:modern_treasurer, :secret)
    organitzation_id = Application.get_env(:modern_treasurer, :organitzation_id)
    "#{organitzation_id}:#{secret}" |> Base.encode64()
  end
end
