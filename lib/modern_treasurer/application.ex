defmodule ModernTreasurer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # 1_20_000 => 2 mins
      {Finch, name: ModernTreasuryFinch, receive_timeout: 1_20_000}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ModernTreasurer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
