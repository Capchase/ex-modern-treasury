defmodule ModernTreasurerTest do
  @moduledoc """
  Tests for ModernTreasurer API
  """
  use ExUnit.Case, async: true

  alias ModernTreasurer.Account
  alias ModernTreasurer.CounterParty
  alias ModernTreasurer.HTTP.Client
  alias ModernTreasurer.Utils

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
end
