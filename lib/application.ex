defmodule Watchdog do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Watchdog.Router, [], port: 8550)
    ]

    Logger.info("WatchDog Server started");
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
