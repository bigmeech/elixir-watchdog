defmodule Watchdog.Util do
    defmodule WatchdogAgent do
        def start, do: accept
        def accept do
            receive do
                {:reset} -> accept
                after 3000 -> clean_up
            end
        end

        defp clean_up do
            case HTTPoison.get "http://www.mocky.io/v2/5b46137e3200008500301ae" do
                {:ok, %HTTPoison.Response{ status_code: 200, body: body}} ->
                    IO.puts body
                {:error, %HTTPoison.Error{reason: reason}} ->
                    IO.puts reason
            end
        end
    end
end