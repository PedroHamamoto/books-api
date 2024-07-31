defmodule BooksApi.AuthorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BooksApi.Authors` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> BooksApi.Authors.create_author()

    author
  end
end
