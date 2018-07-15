defmodule Watchdog.Handler.Reset do
    # register client with a new process and return pid
    def init(optns), do: optns
     
    # reset timer by process id. send a 404 if client tries to
    # reset timer for an unknowns process
    def reset(conn, optns) do
        proc_id = conn.params.pid
        send proc_id, { :reset, "resetting watchdog timeout for " <> proc_id }
        conn.send_resp(200, "Timer for " <> proc_id <> " has been reset")
    end
end