defmodule Watchdog.Middleware.GetPID do
    import Plug.Conn

    def init([]), do: false
    def call(%Plug.Conn{params: %{"pid" => pid }} = conn, options) do
        IO.puts "Extracting pid from request"
        assign(conn, :pid, pid)
    end
end