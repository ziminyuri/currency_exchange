defmodule CurrencyWeb.PageControllerTest do
  use CurrencyWeb.ConnCase

  describe "index" do
    test "lists all currencies", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :index))
      assert html_response(conn, 200) =~ "USD"
      assert html_response(conn, 200) =~ "EUR"
      assert html_response(conn, 200) =~ "Евро"
      assert html_response(conn, 200) =~ "Доллар США"
    end
  end

  describe "converter" do
    test "lists all currencies", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :converter))
      assert html_response(conn, 200) =~ "USD"
      assert html_response(conn, 200) =~ "EUR"
    end
  end

  test "cache has info about USD" do
    data_from_cache = Currency.Cache.lookup("USD") |> List.first

    assert elem(data_from_cache, 0) == "USD"
    assert elem(data_from_cache, 1) == "Доллар США"
    assert tuple_size(data_from_cache) == 3
  end

  test "cache has info about EUR" do
    data_from_cache = Currency.Cache.lookup("EUR") |> List.first

    assert elem(data_from_cache, 0) == "EUR"
    assert elem(data_from_cache, 1) == "Евро"
    assert tuple_size(data_from_cache) == 3
  end

end
