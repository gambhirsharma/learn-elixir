defmodule TodoList.Schema.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :title, :string
    field :description, :string
    field :completed, :boolean, default: false
    field :due_date, :date

    timestamps()
  end

  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description, :completed, :due_date])
    |> validate_required([:title])
  end
end
