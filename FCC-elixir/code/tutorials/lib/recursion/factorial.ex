defmodule Tutorials.Recursion.Factorial do
  def of(1), do: 1
  def of(num), do: num * of(num - 1) # recursive call

  # tail recursion
  def of_tail_rec(num, acc \\ 1) # function definition **note: ** always got on the top
  def of_tail_rec(1, acc), do: acc
  def of_tail_rec(num, acc), do: of_tail_rec(num - 1, acc * num)
end
