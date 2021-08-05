defmodule Currency.Daily do

  def get_currencies() do
    result = "https://www.cbr-xml-daily.ru/daily_json.js" |> HTTPoison.get |> parse_resp
  end

  defp parse_resp({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_currencies
  end
  defp parse_resp(_), do: :error

  defp pull_currencies(%{"Valute" => valute} = _body) do
    result = Enum.map(valute, fn{code, %{"Name" => name, "Value" => value}} -> %{name: name, value: value, code: code}
    end)
    {:ok, result}

  end
  defp pull_currencies(_), do: :error

end