defmodule MemoPhoenix.UserView do
  use MemoPhoenix.Web, :view
  alias MemoPhoenix.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
