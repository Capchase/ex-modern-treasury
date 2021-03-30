defmodule ModernTreasurerTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start()
  end

  test "test get counterparty" do
    ExVCR.Config.filter_request_headers("Authorization")

    use_cassette "get_counterparty" do
      fake_company_id = "4af839ee-b35b-4976-b904-148afc492099"
      {:ok, body} = ModernTreasurer.get_counterparty(fake_company_id)
      response = JSON.decode!(body.body)
      assert response["name"] =~ "CaptainMarvel"
      assert response["object"] =~ "counterparty"
    end
  end
end
