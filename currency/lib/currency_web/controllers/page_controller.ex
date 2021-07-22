defmodule CurrencyWeb.PageController do
  use CurrencyWeb, :controller

  alias Currency.{Daily, Repo, Cache, Transform}

  def index(conn, _params) do
    render conn, "index.html", currencies: Cache.all()
  end

  def converter(conn, _params) do
    render(conn, "converter.html")
  end

  def converter_post(conn, params) do
    IO.puts("-----------post--------------")
    whom = params["email"]["whom"]
    IO.inspect whom
    IO.puts("-----------post--------------")
    render(conn, "converter.html")
  end

end
