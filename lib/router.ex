defmodule Watchdog.Router do
    use Plug.Router

    plug Plug.Logger
    plug :match
    plug :dispatch

    post "/api/pulse", to: Watchdog.Handler.Register
    get "/api/pulse/:pid", to: Watchdog.Handler.Reset
    
    match _ do 
        send_resp(conn, 404, "404 Not Found")
    end
end