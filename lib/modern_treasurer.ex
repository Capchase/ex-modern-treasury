defmodule ModernTreasurer do
  @moduledoc """
  Documentation for `ModernTreasurer`.
  """

  def get_counterparty(id) do
    body =
      ModernTreasurer.CounterParty.get_counterparty(%{id: id})
      |> ModernTreasurer.Utils.get_response_body()

    json_body = body |> Jason.encode!()

    {:ok, json_body}
  end
end
