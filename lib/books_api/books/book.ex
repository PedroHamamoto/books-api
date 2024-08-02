defmodule BooksApi.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :isbn, :string
    field :author, :id
    field :genre, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :author, :genre])
    |> validate_required([:title, :isbn, :author, :genre])
  end
end
