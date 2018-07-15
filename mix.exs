defmodule ElixirWatchdogPoc.MixProject do
  use Mix.Project

  def project do
    [
      app: :application,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:poolboy, :cowboy, :plug, :poison, :httpoison, :logger],
      extra_applications: [:logger],
      mod: {Watchdog, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.3"},
      {:plug, "~> 1.0" },
      {:poison, "~> 3.1"},
      {:poolboy, ">= 0.0.0"},
      {:httpoison, "~> 1.0"},
      {:logger, github: "josevalim/logger"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
