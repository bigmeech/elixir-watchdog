defmodule Watchdog.Service do
    import Plug.Conn
    import Poison
    import Watchdog.Models

    use Plug.Builder

    plug Plug.Logger
    plug :get_process_id
    plug :respond
    def get_process_id(%Plug.Conn{request_path: "/api/pulse/" <> pid} = conn, opts) do
        assign(conn, :pid, pid)
    end

    def respond(conn, opts) do
        conn
        |> send_resp(200, Poison.encode!(%Watchdog.Models.HeartbeatResponse{status: "running", pid: conn.assigns.pid}))
    end
end