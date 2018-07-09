defmodule Watchdog.Errors do
    defmodule InvalidProcessIdError do
    @moduledoc """
        Error raised when the process id being sent a messsage has been killed.
    """

    defexception message: "cannot find process id", plug_status: 400
    end
end