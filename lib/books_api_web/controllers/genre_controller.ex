defmodule BooksApiWeb.GenreController do
  use BooksApiWeb, :controller

  alias BooksApi.Genres
  alias BooksApi.Genres.Genre

  action_fallback BooksApiWeb.FallbackController

  def index(conn, _params) do
    genres = Genres.list_genres()
    render(conn, :index, genres: genres)
  end

  def create(conn, genre_params) do
    with {:ok, %Genre{} = genre} <- Genres.create_genre(genre_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/genres/#{genre}")
      |> render(:show, genre: genre)
    end
  end

  def show(conn, %{"id" => id}) do
    genre = Genres.get_genre!(id)
    render(conn, :show, genre: genre)
  end
end
