defmodule MonacoExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MonacoExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MonacoExample.PubSub},
      # Start the Endpoint (http/https)
      MonacoExampleWeb.Endpoint
      # Start a worker by calling: MonacoExample.Worker.start_link(arg)
      # {MonacoExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MonacoExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MonacoExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
