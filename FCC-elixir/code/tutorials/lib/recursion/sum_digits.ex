defmodule Tutorials.Recursion.SumDigits do

  def upto(0), do: 0    # base case

  def upto(num) do 
    num + upto(num - 1) # this is little expensive function
    # upto_tail_rec(num) # this is less expensive 
  end

  # tail recursion
  def upto_tail_rec(num, acc \\ 0)     # function definition

  def upto_tail_rec(0, acc), do: acc   # base case
  def upto_tail_rec(num, acc) do 
    upto_tail_rec(num - 1, acc + num)
  end
end

