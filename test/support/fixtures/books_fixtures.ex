defmodule BooksApi.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BooksApi.Books` context.
  """
  alias BooksApi.GenresFixtures
  alias BooksApi.AuthorsFixtures

  @doc """
  Generate a book.
  """
  import AuthorsFixtures
  import GenresFixtures

  def book_fixture(attrs \\ %{}) do
    author = author_fixture()
    genre = genre_fixture()

    {:ok, book} =
      attrs
      |> Enum.into(%{
        isbn: "some isbn",
        title: "some title",
        author: author.id,
        genre: genre.id
      })
      |> BooksApi.Books.create_book()

    book
  end
end
