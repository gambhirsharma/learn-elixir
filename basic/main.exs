# _x = 10 
# IO.puts('Hellow')

# function are definded by def inside module

defmodule Math do
  def add(a, b) do
    c = a + b
    IO.puts(c)
  end
end

Math.add(1, 2)

# ---
# Concurrency and Parallelism in Elixir
spawn(fn -> IO.puts("Hello from anohter process!") end)

# ----
# Error handling
try do
  File.read(~c"text.txt")
rescue
  e in File.Error -> IO.puts(~c"Error: #{e.message}")
end

