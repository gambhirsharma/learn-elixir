defmodule Tutorials.Lists do
  @moduledoc """
  Function Summary

  1. sum
  """

  @doc """
  Returns the sum of a list of numbers.
  """
  @spec sum(list(number())) :: number()
  def sum(nums), do: sum_tail_rec(nums)

  def sum_simple([]), do: 0
  def sum_simple([h | t]), do: h + sum_simple(t)

  # tail-recursive
  def sum_tail_rec(list, acc \\ 0)
  def sum_tail_rec([], acc), do: acc

  def sum_tail_rec([h | t], acc) do
    sum_tail_rec(t, acc + h)
  end

  # --------------------------  Reverse List --------------------------

  # list(any()) == [any()]
  @spec reverse(list(any()), [any()]) :: [any()]

  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc

  def reverse([h | t], acc) do
    reverse(t, [h | acc])
  end

  # --------------------------  Maps ----------------------------------
  @spec map([any()], (any() -> any()), [any()]) :: [any()]
  def map(element, func, acc \\ [])
  def map([], _, acc), do: acc |> reverse

  def map([h | t], func, acc) do
    map(t, func, [func.(h) | acc])
  end

  # this map gives the answer in reverse order so 
  # Tutorials.Lists.map([1,2,3], fn x -> x*2 end)  # [6, 4, 2]
  # Tutorials.Lists.reverse(Tutorials.Lists.map([1,2,3], fn x -> x*2 end))  # [2, 4, 6]
  # Tutorials.Lists.map([1,2,3], fn x -> x*2 end) |> Tutorials.Lists.reverse()  # [2, 4, 6]

  # --------------------- Concat ----------------------
  @spec concat([any()], [any()]) :: [any()]
  def concat(src, dst), do: concat_func(src |> reverse(), dst)
  defp concat_func([], dst), do: dst
  defp concat_func([h|t], dst), do: concat_func(t, [h | dst])

  # --------------------- FlatMap -----------------------
  def flat_map(element, func, acc \\ [])
  def flat_map([], _func, acc ), do: acc
  def flat_map([h|t], func, acc), do: flat_map(t, func, concat(acc, func.(h)))
  
end

# `def` is used to declare name function. Where as `fn` is anonymous function 
# named function belong to a module where as `fn` doesn't belong to a module
# iex> double = fn x -> x * 2 end
# iex> double.(2) # 4
# ** Takeaways **
# - `fn` declare a anonymous function
# - `end` is used to end the fn
# - `.` is used to call a fn and then the parameters comes
