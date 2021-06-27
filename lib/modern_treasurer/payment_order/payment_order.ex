defmodule ModernTreasurer.PaymentOrder do
  @moduledoc """
  Contains all logic related to creating, updating and listing payment orders. https://docs.moderntreasury.com/reference#create-payment-order
  """
  alias ModernTreasurer.HTTP.Client
  use EnumType

  defenum Direction do
    value(Credit, "credit")
    value(Debit, "debit")
  end

  defenum Type do
    value(ACH, "ach")
    value(SEPA, "sepa")
    value(BACS, "bacs")

    default(ACH)
  end

  @type create_order_params :: %{
          id: Strings.t(),
          direction: Direction,
          type: Type,
          amount: integer(),
          currency: Strings.t(),
          description: Strings.t(),
          statement_descriptor: Strings.t(),
          metadata: Map,
          effective_date: Date,
          originating_account_id: Strings.t(),
          receiving_account_id: Strings.t()
        }

  @doc """
  create_order creates an order in MT. https://docs.moderntreasury.com/reference#create-payment-order
  """
  @spec create_order(create_order_params()) :: {:ok, Tesla.Env} | {:error, any()}
  def create_order(
        %{
          "id" => payment_id,
          "direction" => _direction,
          "type" => _type,
          "amount" => amount,
          "originating_account_id" => _originating_account_id,
          "receiving_account_id" => _receiving_account_id
        } = params
      ) do
    case is_integer(amount) do
      true -> Client.post!("payment_orders", params, headers: [{"Idempotency-Key", payment_id}])
      false -> {:error, "amount must be an integer"}
    end
  end
end
