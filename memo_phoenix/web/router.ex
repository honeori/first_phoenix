defmodule MemoPhoenix.Router do
  use MemoPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MemoPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", HelloController, :index
    get "/users", UserController, :index
    get "/users/:user", UserController, :show
  end
end
