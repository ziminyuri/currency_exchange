defmodule CurrencyWeb.PageController do
  use CurrencyWeb, :controller

  alias Currency.(Daily, Repo)

  def index(conn, _params) do
    result = Daily.get_currencies()

    IO.puts "-----------index------------------"
    IO.inspect result
    IO.puts "-------------index----------------"

    render(conn, "index.html")

  end


  def converter(conn, _params) do
    render(conn, "converter.html")
  end
end
