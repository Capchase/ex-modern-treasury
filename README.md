# ModernTreasurer

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `modern_treasurer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:modern_treasurer, "~> 0.1.0"}
  ]
end
```

You need to configure the secrets for `ModernTreasurer` to use internally:
Put the following in your `config/config.exs` and `config/runtime.exs` files.

```elixir
config :modern_treasurer,
  base_url: System.get_env("MODERN_TREASURY_BASE_URL", "https://app.moderntreasury.com/api"),
  organization_id: System.get_env("MODERN_TREASURY_ORGANIZATION_ID"),
  api_key: System.get_env("MODERN_TREASURY_API_KEY")
```

# Utils

To get the `body` from response, we can use `ModernTreasurer.Utils.get_response_body` function.
e.g.

```elixir
ModernTreasurer.Account.list_external_accounts(%{})
|> ModernTreasurer.Utils.get_response_body()
```

# API Calls: Accounts

1. List all external_accounts

```elixir
ModernTreasurer.Account.list_external_accounts(%{})
```

2. Get external_account by :id

```elixir
ModernTreasurer.Account.get_external_account(%{id: id})
```

3. Create external_account

```elixir
ModernTreasurer.Account.create_external_account(
  %{
    name: "test-222",
    body_params: %{counterparty_id: "bc665f7b-b08c-4ac3-9c18-ba926d44a60axyz"}
  })
```

# API Calls: CounterParty

1. Get CounterParty

```elixir
ModernTreasurer.CounterParty.get_counterparty(
  %{id: "bc665f7b-b08c-4ac3-9c18-ba926d44a60axyz"}
)
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/modern_treasurer](https://hexdocs.pm/modern_treasurer).
