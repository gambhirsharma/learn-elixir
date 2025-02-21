defmodule TodoList.CLI do
  alias TodoList.TodoManager

  def main do
    IO.puts("Todo List Application")
    IO.puts("====================")
    display_menu()
    handle_input()
  end

  defp display_menu do
    IO.puts("\nAvailable Commands:")
    IO.puts("1. List all todos")
    IO.puts("2. Add a new todo")
    IO.puts("3. View a todo")
    IO.puts("4. Update a todo")
    IO.puts("5. Delete a todo")
    IO.puts("6. Mark a todo as completed")
    IO.puts("7. List completed todos")
    IO.puts("8. List pending todos")
    IO.puts("9. Exit")
  end

  defp handle_input do
    choice = IO.gets("Enter your choice (1-9): ") |> String.trim()

    case choice do
      "1" -> list_todos()
      "2" -> add_todo()
      "3" -> view_todo()
      "4" -> update_todo()
      "5" -> delete_todo()
      "6" -> complete_todo()
      "7" -> list_filtered_todos(:completed)
      "8" -> list_filtered_todos(:pending)
      "9" -> 
        IO.puts("Goodbye!")
        System.stop(0)
      _ ->
        IO.puts("Invalid choice. Please try again.")
        display_menu()
        handle_input()
    end

    display_menu()
    handle_input()
  end

  defp list_todos do
    todos = TodoManager.list_todos()
    display_todos(todos)
  end

  defp list_filtered_todos(:completed) do
    todos = TodoManager.list_todos(completed: true)
    IO.puts("\n=== Completed Todos ===")
    display_todos(todos)
  end

  defp list_filtered_todos(:pending) do
    todos = TodoManager.list_todos(completed: false)
    IO.puts("\n=== Pending Todos ===")
    display_todos(todos)
  end

  defp display_todos([]) do
    IO.puts("No todos found.")
  end

  defp display_todos(todos) do
    IO.puts("\nID | Status | Title | Due Date")
    IO.puts("--------------------------------")
    
    Enum.each(todos, fn todo -> 
      status = if todo.completed, do: "✓", else: "□"
      due_date = if todo.due_date, do: Date.to_string(todo.due_date), else: "N/A"
      IO.puts("#{todo.id} | #{status} | #{todo.title} | #{due_date}")
    end)
  end

  defp add_todo do
    title = IO.gets("Title: ") |> String.trim()
    description = IO.gets("Description (optional): ") |> String.trim()
    due_date_str = IO.gets("Due date (YYYY-MM-DD, optional): ") |> String.trim()
    
    due_date = case due_date_str do
      "" -> nil
      date_str -> 
        case Date.from_iso8601(date_str) do
          {:ok, date} -> date
          _ -> 
            IO.puts("Invalid date format. Using no due date.")
            nil
        end
    end

    attrs = %{
      title: title,
      description: if(description != "", do: description, else: nil),
      due_date: due_date
    }

    case TodoManager.create_todo(attrs) do
      {:ok, todo} -> IO.puts("Todo created successfully! ID: #{todo.id}")
      {:error, changeset} -> IO.puts("Error: #{inspect changeset.errors}")
    end
  end

  defp view_todo do
    id = get_todo_id()
    case TodoManager.get_todo(id) do
      nil -> IO.puts("Todo not found.")
      todo -> display_todo_details(todo)
    end
  end

  defp display_todo_details(todo) do
    status = if todo.completed, do: "Completed", else: "Pending"
    due_date = if todo.due_date, do: Date.to_string(todo.due_date), else: "None"
    
    IO.puts("\n=== Todo ##{todo.id} ===")
    IO.puts("Title: #{todo.title}")
    IO.puts("Description: #{todo.description || 'None'}")
    IO.puts("Status: #{status}")
    IO.puts("Due Date: #{due_date}")
    IO.puts("Created At: #{NaiveDateTime.to_string(todo.inserted_at)}")
  end

  defp update_todo do
    id = get_todo_id()
    todo = TodoManager.get_todo(id)
    
    case todo do
      nil -> 
        IO.puts("Todo not found.")
      todo ->
        IO.puts("Current title: #{todo.title}")
        IO.puts("Leave blank to keep current value")
        
        title = IO.gets("New title: ") |> String.trim()
        description = IO.gets("New description: ") |> String.trim()
        due_date_str = IO.gets("New due date (YYYY-MM-DD): ") |> String.trim()
        completed_str = IO.gets("Completed? (y/n): ") |> String.trim() |> String.downcase()
        
        attrs = %{}
        attrs = if title != "", do: Map.put(attrs, :title, title), else: attrs
        attrs = if description != "", do: Map.put(attrs, :description, description), else: attrs
        
        attrs = if due_date_str != "" do
          case Date.from_iso8601(due_date_str) do
            {:ok, date} -> Map.put(attrs, :due_date, date)
            _ -> 
              IO.puts("Invalid date format. Keeping current due date.")
              attrs
          end
        else
          attrs
        end
        
        attrs = case completed_str do
          "y" -> Map.put(attrs, :completed, true)
          "n" -> Map.put(attrs, :completed, false)
          _ -> attrs
        end
        
        case TodoManager.update_todo(id, attrs) do
          {:ok, _} -> IO.puts("Todo updated successfully!")
          {:error, changeset} -> IO.puts("Error: #{inspect changeset.errors}")
          error -> IO.puts("Error: #{inspect error}")
        end
    end
  end

  defp delete_todo do
    id = get_todo_id()
    case TodoManager.delete_todo(id) do
      {:ok, _} -> IO.puts("Todo deleted successfully!")
      {:error, :not_found} -> IO.puts("Todo not found.")
      {:error, changeset} -> IO.puts("Error: #{inspect changeset.errors}")
    end
  end

  defp complete_todo do
    id = get_todo_id()
    case TodoManager.complete_todo(id) do
      {:ok, _} -> IO.puts("Todo marked as completed!")
      {:error, :not_found} -> IO.puts("Todo not found.")
      {:error, changeset} -> IO.puts("Error: #{inspect changeset.errors}")
    end
  end

  defp get_todo_id do
    IO.gets("Enter todo ID: ")
    |> String.trim()
    |> String.to_integer()
  rescue
    _ -> 
      IO.puts("Invalid ID. Please enter a number.")
      get_todo_id()
  end
end
