defmodule Watchdog.Util do
    defmodule WatchdogAgent do
        import Logger
        def start(client_id) do
            accept(client_id)
        end
        def accept(client_id) do
            receive do
                { :reset } -> accept(client_id)
                after 10000 -> clean_up(client_id)
            end
        end

        defp clean_up(client_id) do
            Logger.info("cleaning process responsisble for " <> client_id)
            case HTTPoison.get "http://www.mocky.io/v2/5b4b9ae83100006003a7de2a" do
                {:ok, %HTTPoison.Response{ status_code: 200, body: body}} ->
                    Logger.info("Transit time for " <> client_id <> " sent to http://www.mocky.io/v2/5b4b9ae83100006003a7de2a")
                {:error, %HTTPoison.Error{reason: reason}} ->
                    Logger.error(reason)
            end
        end
    end
end