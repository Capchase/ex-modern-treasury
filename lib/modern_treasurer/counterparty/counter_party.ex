defmodule ModernTreasurer.CounterParty do
  @moduledoc """
  APIs for CounterParty
  """
  alias ModernTreasurer.HTTP.Client

  def list_counterparties(attrs) do
    query_params = Map.get(attrs, :query_params, []) |> Enum.into([])
    Client.get("/counterparties", query: query_params)
  end

  def create_counterparty(attrs \\ %{name: "test-cp-tesla-1"}) do
    Client.post("/counterparties", attrs)
  end

  def get_counterparty(attrs \\ %{id: "bc665f7b-b08c-4ac3-9c18-ba926d44a60a"}) do
    id = Map.get(attrs, :id, "") |> String.trim()

    result =
      case id do
        "" -> {:error, "ID cannot be empty string or nil"}
        _ -> Client.get("/counterparties/#{id}")
      end

    result
  end

  def update_counterparty(%{id: id, body_params: body_params}) do
    Client.patch("counterparties/#{id}", body_params)
  end

  def collect_account_details(%{id: id, body_params: body_params}) do
    Client.post("counterparties/#{id}/collect_account", body_params)
  end

  def delete_counterparty(%{id: id} = _attrs) do
    id = id |> String.trim()

    result =
      case id do
        "" -> {:error, "ID cannot be empty string or nil"}
        _ -> Client.delete("counterparties/#{id}")
      end

    result
  end
end