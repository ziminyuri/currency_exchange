defmodule CurrencyWeb.PageController do
  use CurrencyWeb, :controller

  alias Currency.{Daily, Repo, Cache}

  def index(conn, _params) do
    result = Daily.get_currencies()

    #IO.puts "-----------index------------------"
    #IO.inspect result
    #IO.puts "-------------index----------------"

    #Cache.insert(result)

    #table = Cache.all()
    IO.puts "-----------table------------------"
    #IO.inspect table
    IO.puts "-------------table----------------"

    render conn, "index.html", currencies: result

  end


  def converter(conn, _params) do
    render(conn, "converter.html")
  end
end
