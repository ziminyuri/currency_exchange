defmodule Currency.Daily do

  def get_currencies() do
    result = "https://www.cbr-xml-daily.ru/daily_json.js" |> HTTPoison.get |> parse_resp

    case result do
      {:ok, currencies} -> currencies
      :error -> nil
    end

  end

  defp parse_resp({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_currencies
  end
  defp parse_resp(_), do: :error

  defp pull_currencies(body) do

    # Warning говнокод
    %{"Valute" => %{"USD" => %{"Name" => usd_name}}} = body
    %{"Valute" => %{"USD" => %{"Value" => usd_value}}} = body
    %{"Valute" => %{"USD" => %{"CharCode" => usd_code}}} = body

    %{"Valute" => %{"EUR" => %{"Name" => eur_name}}} = body
    %{"Valute" => %{"EUR" => %{"Value" => eur_value}}} = body
    %{"Valute" => %{"EUR" => %{"CharCode" => eur_code}}} = body

    usd = %{:name => usd_name, :value => usd_value, :code => usd_code}
    eur = %{:name => eur_name, :value => eur_value, :code => eur_code}

    {:ok, [usd, eur]}
    #[usd, eur]
  end
  defp pull_currencies(_), do: :error

end