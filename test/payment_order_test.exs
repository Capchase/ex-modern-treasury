defmodule ModernTreasurerTest.PaymentOrder do
  @moduledoc """
  Tests for ModernTreasurer API
  """
  use ExUnit.Case, async: true

  import Tesla.Mock

  alias ModernTreasurer.PaymentOrder
  alias ModernTreasurer.PaymentOrder.{Direction, Type}

  setup do
    mock(fn
      %{method: :post, url: "https://app.moderntreasury.com/api/payment_orders"} ->
        json(%{
          "id" => "c5f4009c-bdd6-4cc1-84b2-17974ac9e77a",
          "type" => "ach",
          "amount" => 20_000,
          "direction" => "credit",
          "originating_account_id" => "0f8e3719-3dfd-4613-9bbf-c0333781b59f",
          "receiving_account" => %{
            "id" => "5acec2ef-987b-4260-aa97-b719eeb0a8d5",
            "account_type" => "checking",
            "party_name" => "John Smith",
            "party_type" => "business",
            "party_address" => nil,
            "account_details" => [
              %{
                "id" => "81a7cd32-39f5-4f0c-873f-4d9137ec9cd9",
                "account_number" => "1293291291",
                "account_number_type" => nil
              }
            ],
            "routing_details" => [
              %{
                "id" => "5ceb251f-0235-48a2-81cb-0c668f5ee81b",
                "payment_type" => nil,
                "routing_number" => "121141822",
                "routing_number_type" => "aba"
              }
            ]
          },
          "receiving_account_id" => "5acec2ef-987b-4260-aa97-b719eeb0a8d5",
          "receiving_account_type" => "external_account",
          "accounting_category_id" => "45ac4565-2302-41c9-962a-1a9d7e85db99",
          "accounting_ledger_class_id" => "d59c3d5c-bcf9-4efb-8a0a-46a5f4394028",
          "currency" => "USD",
          "effective_date" => "2018-11-08",
          "priority" => "normal",
          "description" => "Repellendus deleniti atque quod.",
          "statement_descriptor" => "Rerum del.",
          "remittance_information" => "Accusamus tempore molestiae laboriosam.",
          "metadata" => %{},
          "status" => "approved",
          "counterparty_id" => "37ba4454-dd33-4aa0-8906-0e2e4103e45c",
          "transaction_ids" => [],
          "current_return" => nil,
          "charge_bearer" => nil,
          "foreign_exchange_indicator" => nil,
          "foreign_exchange_contract" => nil,
          "nsf_protected" => false,
          "originating_party_name" => "Acme Company",
          "ultimate_originating_party_name" => "Jane Doe",
          "ultimate_originating_party_identifier" => "A1823N",
          "live_mode" => true,
          "created_at" => "2019-11-09T00:11:07Z",
          "updated_at" => "2019-11-09T00:11:07Z"
        })
    end)

    :ok
  end

  test "works if all required fields are present" do
    test_params = %{
      "id" => "12345",
      "direction" => Direction.Credit.value(),
      "type" => Type.ACH.value(),
      "amount" => 12_345_000,
      "originating_account_id" => "someid",
      "receiving_account_id" => "somehting"
    }

    assert %{"status" => "approved"} = PaymentOrder.create_order(test_params).body
  end

  test "guards against floats in amounts" do
    test_params = %{
      "id" => "12345",
      "direction" => Direction.Credit.value(),
      "type" => Type.ACH.value(),
      "amount" => 1.235,
      "originating_account_id" => "someid",
      "receiving_account_id" => "somehting"
    }

    assert {:error, "amount must be an integer"} = PaymentOrder.create_order(test_params)
  end
end
