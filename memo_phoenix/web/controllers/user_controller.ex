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

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do 
      {:ok, user} -> 
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
