defmodule ModernTreasurer.Config do
  @moduledoc """
  Fetch the required config
  """
  def base_url do
    base_url =
      case Application.fetch_env(:modern_treasurer, :base_url) do
        {:ok, base_url} -> base_url
        _ -> "https://app.moderntreasury.com/api"
      end

    base_url
  end

  def organization_id do
    Application.fetch_env!(:modern_treasurer, :organization_id)
  end

  def api_key do
    Application.fetch_env!(:modern_treasurer, :api_key)
  end
end
