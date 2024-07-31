defmodule BooksApiWeb.AuthorJSON do
  alias BooksApi.Authors.Author

  @doc """
  Renders a list of authors.
  """
  def index(%{authors: authors}) do
    for(author <- authors, do: data(author))
  end

  @doc """
  Renders a single author.
  """
  def show(%{author: author}) do
    data(author)
  end

  defp data(%Author{} = author) do
    %{
      id: author.id,
      name: author.name
    }
  end
end
