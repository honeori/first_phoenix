defmodule MemoPhoenix.Repo do
  #use Ecto.Repo, otp_app: :memo_phoenix
  #@moduledoc""
  #In memory repository.
  #""

  def all(MemoPhoenix.User) do
    [%MemoPhoenix.User{id: "1",name: "honeori jose", username: "josevalim", password: "elixir"},
     %MemoPhoenix.User{id: "2",name: "hoge jose", username: "josevalim", password: "elixir"},
     %MemoPhoenix.User{id: "3",name: "fuga jose", username: "josevalim", password: "elixir"}]
  end

  def all(_module), do: []

  def get(module, id) do
    get_by(module,id: id)
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key,val} -> Map.get(map, key) == val end)
    end
  end

end
