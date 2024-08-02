defmodule BooksApiWeb.Router do
  use BooksApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BooksApiWeb do
    pipe_through :api

    # authors
    get "/authors", AuthorController, :index
    get "/authors/:id", AuthorController, :show
    post "/authors", AuthorController, :create

    # genres
    get "/genres", GenreController, :index
    get "/genres/:id", GenreController, :show
    post "/genres", GenreController, :create

    # books
    get "/books", BookController, :index
    get "/books/:id", BookController, :show
    post "/books", BookController, :create
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:books_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BooksApiWeb.Telemetry
    end
  end
end
