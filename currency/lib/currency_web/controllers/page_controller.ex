defmodule CurrencyWeb.PageController do
  use CurrencyWeb, :controller

  alias Currency.{Daily, Repo, Cache}

  def index(conn, _params) do
    table = Cache.all()
    render conn, "index.html", currencies: table
  end

  def converter(conn, _params) do
    table = Cache.all()
    render conn, "converter.html", currencies: table, converter_value: nil
  end

  def converter_post(conn, params) do
    currency_code = params["converter_form"]["currency_code"]
    value_before_convert = params["converter_form"]["input_value_before_convert"]

    currency_data =  currency_code |> Cache.lookup |> List.first
    currency_value = elem(currency_data, 2)
    value_before_convert =  elem(Float.parse(value_before_convert), 0)
    converter_value = value_before_convert * currency_value

    table = Cache.all()
    render conn, "converter.html", currencies: table, converter_value: converter_value

  end
end
