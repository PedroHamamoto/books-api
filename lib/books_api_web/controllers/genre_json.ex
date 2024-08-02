defmodule BooksApiWeb.GenreJSON do
  alias BooksApi.Genres.Genre

  @doc """
  Renders a list of genres.
  """
  def index(%{genres: genres}) do
    for(genre <- genres, do: data(genre))
  end

  @doc """
  Renders a single genre.
  """
  def show(%{genre: genre}) do
    data(genre)
  end

  defp data(%Genre{} = genre) do
    %{
      id: genre.id,
      name: genre.name
    }
  end
end
