defmodule Watchdog.Util do
    defmodule WatchdogAgent do
        import Logger

        def start(client_id) do
            accept(client_id)
        end
        def accept(client_id) do
            countdown = Application.fetch_env!(:application, :countdown)
            receive do
                { :reset } -> accept(client_id)
                after countdown -> clean_up(client_id)
            end
        end

        defp clean_up(client_id) do
        endpoint = Application.fetch_env!(:application, :endpoint)
            Logger.info("cleaning process responsisble for " <> client_id)
            case HTTPoison.get endpoint do
                {:ok, %HTTPoison.Response{ status_code: 200, body: body}} ->
                    Logger.info("Transit time for " <> client_id <> " sent to http://www.mocky.io/v2/5b4b9ae83100006003a7de2a")
                {:error, %HTTPoison.Error{reason: reason}} ->
                    Logger.error(reason)
            end
        end
    end
end