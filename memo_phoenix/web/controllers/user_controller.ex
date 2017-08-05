defmodule MemoPhoenix.UserController do
  use MemoPhoenix.Web, :controller

  alias MemoPhoenix.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def index(conn, _params) do
    users = Repo.all(MemoPhoenix.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"user" => user}) do
    render conn, "show.html", user: user
  end
end
