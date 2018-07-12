defmodule Watchdog.Router do
    use Plug.Router

    plug Plug.Logger
    plug :match
    plug :dispatch

    forward "/api/pulse/:pid", to: Watchdog.Handler.Heartbeat
    match _ do 
        send_resp(conn, 404, "404 Not Found")
    end
end