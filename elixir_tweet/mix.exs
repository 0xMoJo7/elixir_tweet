defmodule ElixirTweet.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_tweet,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :quantum, :extwitter],
      mod: {ElixirTweet.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:quantum, "~> 2.2.3"},
      {:credo, "~> 0.4.11"},
      {:extwitter, "~> 0.7.2"},
      {:oauth, github: "tim/erlang-oauth"}
    ]
  end
end
