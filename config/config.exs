import Config

config :tesla, :adapter, {Tesla.Adapter.Finch, name: ModernTreasuryFinch}

if Mix.env() == :test do
  config :tesla, adapter: Tesla.Mock
end
