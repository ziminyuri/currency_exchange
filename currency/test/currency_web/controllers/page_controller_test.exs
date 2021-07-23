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

end
