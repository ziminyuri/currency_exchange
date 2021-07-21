defmodule Currency.Daily do

  def get_currencies() do
    result = "https://www.cbr-xml-daily.ru/daily_json.js" |> HTTPoison.get |> parse_resp

    IO.puts "---------------get_currencies--------------"
    IO.inspect result
    IO.puts "---------------get_currencies--------------"

    case result do
      _ -> result
    end

  end

  defp parse_resp({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_currencies
  end
  defp parse_resp(_), do: :error

  defp pull_currencies(body) do
    %{"Valute" => %{"USD" => usd}} = body
    %{"Valute" => %{"EUR" => eur}} = body
    %{"Timestamp" => timestamp} = body
    {:ok, usd, eur, timestamp}
  end
  defp pull_currencies(_), do: :error

end