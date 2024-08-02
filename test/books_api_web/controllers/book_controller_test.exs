defmodule BooksApiWeb.BookControllerTest do
  use BooksApiWeb.ConnCase

  import BooksApi.AuthorsFixtures
  import BooksApi.GenresFixtures

  @invalid_attrs %{title: nil, isbn: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all books", %{conn: conn} do
      conn = get(conn, ~p"/api/books")
      assert json_response(conn, 200) == []
    end
  end

  describe "create book" do
    setup [
      :create_author,
      :create_genre
    ]

    test "renders book when data is valid", %{conn: conn, author: author, genre: genre} do
      author_id = author.id
      genre_id = genre.id

      book = %{
        title: "some title",
        isbn: "some isbn",
        author: author_id,
        genre: genre_id
      }

      conn = post(conn, ~p"/api/books", book)

      assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, ~p"/api/books/#{id}")

      assert %{
               "id" => ^id,
               "isbn" => "some isbn",
               "title" => "some title",
               "author" => ^author_id,
               "genre" => ^genre_id
             } = json_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/books", book: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_author(_) do
    author = author_fixture()
    %{author: author}
  end

  defp create_genre(_) do
    genre = genre_fixture()
    %{genre: genre}
  end
end
