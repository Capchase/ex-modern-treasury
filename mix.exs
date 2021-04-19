defmodule ModernTreasurer.MixProject do
  use Mix.Project

  def project do
    [
      app: :modern_treasurer,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ModernTreasurer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:tesla, "~> 1.4"},
      {:finch, "~> 0.6.3"},
      {:jason, "~> 1.2"},
      {:cortex, "~> 0.6.0"}
    ]
  end

  defp dialyzer do
    [
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
      ignore_warning: ".dialyzer_ignore.exs"
    ]
  end
end
