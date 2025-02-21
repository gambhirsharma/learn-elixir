import Config

config :todo_list, TodoList.Repo,
  database: "todo_list.db",
  pool_size: 5

config :todo_list,
  ecto_repos: [TodoList.Repo]
