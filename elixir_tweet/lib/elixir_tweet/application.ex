defmodule ElixirTweet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
  import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: ElixirTweet.Worker.start_link(arg)
      # {ElixirTweet.Worker, arg},
      worker(ElixirTweet.TweetServer, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirTweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    ElixirTweet.Scheduler.schedule_file("* * * * *", 
    Path.join("#{:code.priv_dir(:elixir_tweet)}", "sample.txt"))

    process
  end
end
