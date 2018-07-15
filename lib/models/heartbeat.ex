defmodule Watchdog.Models do
    defmodule HeartbeatResponse do
        @derive [Poison.Encoder]
        defstruct [:status, :pname, :success]
    end
end