defmodule Tutorials.Recursion.PrintDigits do
  # Base case
  def upto(0), do: 0

  # below is the same fn but with elaborated syntax
  #  def upto(0) do
  #  :ok
    # :0 # last line of the function is automatically returned
  # end

  def upto(num) do
    # upto(num - 1) # this will make the loop go in a reverse order [0, 1, 2, 3] **Head recursion**
    IO.puts num
    upto(num - 1) # [3, 2, 1, 0] **Tail recursion**
   end
end

# --- Recursion ---
# Tail recursion
# Head recursion
