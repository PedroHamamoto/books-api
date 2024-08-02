defmodule BooksApiWeb.AuthorControllerTest do
  use BooksApiWeb.ConnCase

  @create_attrs %{
    name: "some name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all authors", %{conn: conn} do
      conn = get(conn, ~p"/api/authors")
      assert json_response(conn, 200) == []
    end
  end

  describe "create author" do
    test "renders author when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/authors", @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, ~p"/api/authors/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/authors", author: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
