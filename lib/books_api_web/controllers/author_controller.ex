defmodule BooksApiWeb.AuthorController do
  use BooksApiWeb, :controller

  alias BooksApi.Authors
  alias BooksApi.Authors.Author

  action_fallback BooksApiWeb.FallbackController

  def index(conn, _params) do
    authors = Authors.list_authors()
    render(conn, :index, authors: authors)
  end

  def create(conn, author_params) do
    with {:ok, %Author{} = author} <- Authors.create_author(author_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/authors/#{author}")
      |> render(:show, author: author)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Authors.get_author!(id)
    render(conn, :show, author: author)
  end
end
