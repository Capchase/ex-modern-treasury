defmodule ModernTreasurer.Config do
  @moduledoc """
  Fetch the required config
  """
  def base_url do
    Application.fetch_env!(:modern_treasurer, :base_url) || "https://app.moderntreasury.com/api"
  end

  def organization_id do
    Application.fetch_env!(:modern_treasurer, :organization_id)
  end

  def api_key do
    Application.fetch_env!(:modern_treasurer, :api_key)
  end
end
