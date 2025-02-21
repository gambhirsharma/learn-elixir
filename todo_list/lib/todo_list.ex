defmodule TodoList.Application do
  use Application

  def start(_type, _args) do
    children = [
      TodoList.Repo
    ]

    opts = [strategy: :one_for_one, name: TodoList.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule TodoList do
  def main do
    TodoList.CLI.main()
  end
end
