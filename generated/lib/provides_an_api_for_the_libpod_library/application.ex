defmodule ProvidesAnAPIForTheLibpodLibrary.Application do
  @moduledoc """
  Application module for starting the Finch HTTP client.

  Finch is required for streaming support in Tesla.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: PodmanOpenAPI.Finch}
    ]

    opts = [strategy: :one_for_one, name: ProvidesAnAPIForTheLibpodLibrary.Supervisor]
    Supervisor.start_link(children, opts)
  end
end