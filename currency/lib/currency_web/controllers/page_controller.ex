defmodule CurrencyWeb.PageController do
  use CurrencyWeb, :controller

  alias Currency.{Daily, Repo, Cache, Transform}

  def index(conn, _params) do
    result = Daily.get_currencies()

    #IO.puts "-----------index------------------"
    #IO.inspect result
    #IO.puts "-------------index----------------"

    Cache.insert(result)

    table = Cache.all()
    IO.puts "-----------table------------------"
    IO.inspect table
    #Transform.from_cache_to_data(table)
    IO.puts "-------------table----------------"

    render conn, "index.html", currencies: table

  end


  def converter(conn, _params) do
    render(conn, "converter.html")
  end
end
