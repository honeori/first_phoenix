defmodule MemoPhoenix.SessionController do
  use MemoPhoenix.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
     case MemoPhoenix.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
       {:ok, conn} ->
         conn
         |> put_flash(:info, "welcome back!")
         |> redirect(to: hello_path(conn, :index))
       {:error, _reason, conn} ->
         conn
         |> put_flash(:error, "Invalid username/password combination")
         |> render("new.html")
     end
    conn
  end

  def delete(conn, _) do
    conn
    |> MemoPhoenix.Auth.logout()
    |> redirect(to: hello_path(conn, :index))
  end
end

