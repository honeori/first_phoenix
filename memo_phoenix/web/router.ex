defmodule MemoPhoenix.Router do
  use MemoPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MemoPhoenix.Auth, repo: MemoPhoenix.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MemoPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", HelloController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/manage", MemoPhoenix do
    pipe_through [:browser, :authenticate_user]

    resources "/videos", VideoController
  end
end
