defmodule BooksApiWeb.BookJSON do
  alias BooksApi.Books.Book

  @doc """
  Renders a list of books.
  """
  def index(%{books: books}) do
    for(book <- books, do: data(book))
  end

  @doc """
  Renders a single book.
  """
  def show(%{book: book}) do
    data(book)
  end

  defp data(%Book{} = book) do
    %{
      id: book.id,
      title: book.title,
      isbn: book.isbn,
      author: book.author,
      genre: book.genre
    }
  end
end
