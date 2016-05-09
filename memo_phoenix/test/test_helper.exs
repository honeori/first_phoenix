ExUnit.start

Mix.Task.run "ecto.create", ~w(-r MemoPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r MemoPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(MemoPhoenix.Repo)

