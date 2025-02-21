defmodule TodoList.TodoManager do
  import Ecto.Query
  alias TodoList.Repo
  alias TodoList.Schema.Todo

  # Create a new todo
  def create_todo(attrs) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
  end

  # Read all todos
  def list_todos do
    Repo.all(Todo)
  end

  # Read todos with filters
  def list_todos(filters) do
    filters
    |> Enum.reduce(Todo, fn
      {:completed, completed}, query ->
        where(query, [t], t.completed == ^completed)
      {:title, title}, query ->
        where(query, [t], ilike(t.title, ^"%#{title}%"))
      {:due_before, date}, query ->
        where(query, [t], t.due_date <= ^date)
      _, query ->
        query
    end)
    |> Repo.all()
  end

  # Read a single todo
  def get_todo(id) do
    Repo.get(Todo, id)
  end

  # Update a todo
  def update_todo(id, attrs) do
    case get_todo(id) do
      nil -> {:error, :not_found}
      todo ->
        todo
        |> Todo.changeset(attrs)
        |> Repo.update()
    end
  end

  # Delete a todo
  def delete_todo(id) do
    case get_todo(id) do
      nil -> {:error, :not_found}
      todo -> Repo.delete(todo)
    end
  end

  # Mark a todo as completed
  def complete_todo(id) do
    update_todo(id, %{completed: true})
  end
end
