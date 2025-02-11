defmodule Tutorials.Recursion.ReverseNum do
# num = 123
# acc = 0
# loop: 
#   new_num = 123/10 = 12
#   new_acc = 0 * 10 + 123 % 10 = 3
#   repeat till num becomes 0 
# return acc

  def of(num, acc \\ 0)
  def of(0, acc), do: acc

  def of(num, acc) do
    new_num = div(num, 10)
    new_acc = acc * 10 + rem(num, 10)
    of(new_num, new_acc)
  end
end


_ =  """
iex> 123/10
12.3

iex> div(123, 10)
12

iex> rem(123, 10)
3
"""
