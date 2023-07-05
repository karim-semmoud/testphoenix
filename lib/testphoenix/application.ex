defmodule Testphoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestphoenixWeb.Telemetry,
      # Start the Ecto repository
      Testphoenix.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Testphoenix.PubSub},
      # Start Finch
      {Finch, name: Testphoenix.Finch},
      # Start the Endpoint (http/https)
      TestphoenixWeb.Endpoint
      # Start a worker by calling: Testphoenix.Worker.start_link(arg)
      # {Testphoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testphoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestphoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
