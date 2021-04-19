defmodule ModernTreasurer.Config do
  def base_url do
    Application.fetch_env!(:modern_treasurer, :base_url)
  end

  def organization_id do
    Application.fetch_env!(:modern_treasurer, :organization_id)
  end

  def api_key do
    Application.fetch_env!(:modern_treasurer, :api_key)
  end
end
