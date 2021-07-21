defmodule CurrencyWeb.PageController do
  use CurrencyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def converter(conn, _params) do
    render(conn, "converter.html")
  end
end
