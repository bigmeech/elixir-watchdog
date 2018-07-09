defmodule Watchdog.Service do
    import Plug.Conn
    import Watchdog.Models

    use Plug.Builder
    use Poison

    plug Plug.Logger
    plug :get_process_id
    plug :respond, %Watchdog.Models.HeartbeatResponse{status: "running", pid: 4538}
    def get_process_id(%Plug.Conn{request_path: "/api/pulse/" <> pid} = conn, opts) do
        assign(conn, :pid, pid)
    end

    def respond(conn, opts) do
        conn
        |> send_resp(conn, 200, Poison.encode!(opts))
    end
end