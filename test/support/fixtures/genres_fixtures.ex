defmodule BooksApi.GenresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BooksApi.Genres` context.
  """

  @doc """
  Generate a genre.
  """
  def genre_fixture(attrs \\ %{}) do
    {:ok, genre} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> BooksApi.Genres.create_genre()

    genre
  end
end
