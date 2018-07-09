defmodule Watchdog.Models do
    defmodule HeartbeatResponse do
        @derive [Poison.Encoder]
        defstruct [:status, :pid]
    end
end