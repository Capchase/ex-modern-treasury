defmodule ModernTreasurerTest do
  @moduledoc """
  Tests for ModernTreasurer API
  """
  use ExUnit.Case, async: true

  alias ModernTreasurer.Account
  alias ModernTreasurer.CounterParty
  alias ModernTreasurer.HTTP.Client
  alias ModernTreasurer.Utils

  test "able to connect ot Modern Treasury API and Auth works" do
    {:ok, %{status: status}} = Client.get("ping")
    assert status == 200
  end

  test "Cannot get counterparty when id is nil or empty string" do
    result_when_id_is_nil = CounterParty.get_counterparty(%{id: nil})
    result_when_id_is_empty_string = CounterParty.get_counterparty(%{id: nil})
    assert :error == result_when_id_is_nil |> elem(0)
    assert :error == result_when_id_is_empty_string |> elem(0)
  end

  test "Cannot get external_account  when id is nil or empty string" do
    result_when_id_is_nil = Account.get_external_account(%{id: nil})
    result_when_id_is_empty_string = Account.get_external_account(%{id: ""})
    assert :error == result_when_id_is_nil |> elem(0)
    assert :error == result_when_id_is_empty_string |> elem(0)
  end

  test "Cannot get internal_account  when id is nil or empty string" do
    result_when_id_is_nil = Account.get_internal_account(%{id: nil})
    result_when_id_is_empty_string = Account.get_internal_account(%{id: ""})
    assert :error == result_when_id_is_nil |> elem(0)
    assert :error == result_when_id_is_empty_string |> elem(0)
  end

  test "list all counterparties" do
    {:ok, %{status: status}} = CounterParty.list_counterparties(%{})
    assert status == 200
  end

  test "get counterparty" do
    existing_counterparty_id =
      CounterParty.list_counterparties(%{})
      |> Utils.get_response_body()
      |> Enum.at(0)
      |> Map.get("id")

    {:ok, %{status: status1}} = CounterParty.get_counterparty(%{id: "non-existant-counterparty"})

    {:ok, %{status: status2}} = CounterParty.get_counterparty(%{id: existing_counterparty_id})

    assert status1 == 404
    assert status2 == 200
  end

  test "list all external_accounts" do
    {:ok, %{status: status}} = Account.list_external_accounts(%{})
    assert status == 200
  end

  test "get external_account" do
    existing_external_account_id =
      Account.list_external_accounts(%{})
      |> Utils.get_response_body()
      |> Enum.at(0)
      |> Map.get("id")

    {:ok, %{status: status1}} =
      Account.get_external_account(%{id: "non-existant-external-account-id"})

    {:ok, %{status: status2}} = Account.get_external_account(%{id: existing_external_account_id})

    # IO.inspect(status1, label: "STATUS-1")
    # IO.inspect(status2, label: "STATUS-2")

    assert status1 == 404
    assert status2 == 200
  end
end
