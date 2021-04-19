defmodule ModernTreasurer.Account do
  @moduledoc """
  API calls for Accounts.
  """
  alias ModernTreasurer.HTTP.Client

  def list_internal_accounts(attrs) do
    query_params = Map.get(attrs, :query_params, []) |> Enum.into([])
    Client.get("/internal_accounts", query: query_params)
  end

  def get_internal_account(%{id: id}) do
    id = id |> Kernel.to_string() |> String.trim()

    result =
      case id do
        "" -> {:error, "ID cannot be empty string or nil"}
        _ -> Client.get("/internal_accounts/#{id}")
      end

    result
  end

  def update_internal_account(%{id: id, body_params: body_params}) do
    Client.patch("internal_accounts/#{id}", body_params)
  end

  def list_external_accounts(attrs) do
    query_params = Map.get(attrs, :query_params, []) |> Enum.into([])
    Client.get("/external_accounts", query: query_params)
  end

  @doc """
  `iex> ModernTreasurer.Account.create_external_account(%{name: "test-222", body_params: %{counterparty_id: "bc665f7b-b08c-4ac3-9c18-ba926d44a60a"}})`
  """
  def create_external_account(attrs) do
    body_params = Map.get(attrs, :body_params, %{})
    
    Client.post("external_accounts", body_params)
  end

  def get_external_account(%{id: id}) do
    id = id |> Kernel.to_string() |> String.trim()

    result =
      case id do
        "" -> {:error, "ID cannot be empty string or nil"}
        _ -> Client.get("/external_accounts/#{id}")
      end

    result
  end

  def update_external_account(%{id: id, body_params: body_params}) do
    Client.patch("external_accounts/#{id}", body_params)
  end

  def delete_external_account(%{id: id} = _attrs) do
    Client.delete("external_accounts/#{id}")
  end

  def initiate_verification(%{id: id, body_params: body_params}) do
    Client.post("/external_accounts/#{id}/verify", body_params)
  end

  def complete_verification(%{id: id, body_params: body_params}) do
    Client.post("/external_accounts/#{id}/complete_verification", body_params)
  end
end
