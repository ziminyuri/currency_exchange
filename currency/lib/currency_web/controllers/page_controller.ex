defmodule CurrencyWeb.PageController do
  use CurrencyWeb, :controller

  alias Currency.{Daily, Repo, Cache}

  def index(conn, _params) do
    table = Cache.all()
    render conn, "index.html", currencies: table
  end

  def converter(conn, _params) do
    table = Cache.all()
    render conn, "converter.html", currencies: table
  end

  def converter_post(conn, params) do
    IO.puts("-----------post--------------")
    currency_code = params["converter_form"]["currency_code"]
    sum = params["converter_form"]["sum"]

    currency_data =  currency_code |> Cache.lookup |> List.first
    currency_value = elem(currency_data, 2)
    sum1 = String.to_float("12")

    IO.inspect sum1
    IO.inspect currency_code
    IO.inspect currency_value
    IO.puts("-----------post--------------")
    table = Cache.all()
    render conn, "converter.html", currencies: table

  end

end
