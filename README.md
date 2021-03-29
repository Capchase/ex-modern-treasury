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

```elixir
config :modern_treasurer, :secret, "your_secret"
config :modern_treasurer, :organitzation_id, "your_organitzation_id"
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/modern_treasurer](https://hexdocs.pm/modern_treasurer).

