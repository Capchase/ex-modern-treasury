defmodule ModernTreasurer.HTTP.Client do
  @moduledoc """
  Documentation for `ModernTreasurer`.
  """
  use Tesla
  alias ModernTreasurer.Config

  # use jason engine
  plug(Tesla.Middleware.JSON)

  plug(
    Tesla.Middleware.BaseUrl,
    Config.base_url()
  )

  plug(Tesla.Middleware.BasicAuth,
    username: Config.organization_id(),
    password: Config.api_key()
  )
end
