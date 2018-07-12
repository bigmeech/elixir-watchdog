defmodule Watchdog.Handler do
    defmodule Heartbeat do
        def init(options) do
            options
        end

        def call(conn, opts) do
            conn
            |> Plug.Conn.send_resp(200, "this is a handler")
        end
    end
end