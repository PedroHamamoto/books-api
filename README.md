# BooksApi
That's a simple application that documents the basices of elixir and phoenix

## Features
* Register an author
* Query a autors
* Register a genre
* Query authros
* Register a book
* Query books

## Stack
* Elixir
* Phoenix
* Postgres
* Kafka

## Prerequisites
Install Elixir and Erlang. I recommend to use [asdf](https://asdf-vm.com/).
```bash
asdf plugin add erlang
asdf plugin add elixir
asdf install
```
Install [docker](https://www.docker.com/).

## Running the application
### Getting the dependencies
```bash
mix deps.get
```

### Executing the database migrations
```bash
docker-compose up -d
mix ecto.setup
```

### Executing the application
```bash
mix phx.serve
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
