defmodule BooksApi.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :isbn, :string, null: false
      add :author, references(:authors, on_delete: :nothing), null: false
      add :genre, references(:genres, on_delete: :nothing), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:books, [:author])
    create index(:books, [:genre])
  end
end
