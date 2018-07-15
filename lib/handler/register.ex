defmodule Watchdog.Handler.Register do
    import Plug.Conn
    import Logger

    def init(optns), do: optns

    # register client with a new process and return pid
    def call(conn, options) do
        conn = fetch_query_params(conn)
        client_id = conn.query_params["client_id"]
        proc_id = spawn(Watchdog.Util.WatchdogAgent, :start, [client_id])
        Logger.info("A Process by the name of #{client_id} has been registered to #{client_id}")
        send_resp(conn, 200, Poison.encode!(%Watchdog.Models.HeartbeatResponse{success: "true", status: 200, pname: client_id}))
    end
end