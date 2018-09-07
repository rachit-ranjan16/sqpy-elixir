defmodule SqPy do
  @moduledoc """
  Documentation for SqPy.
  """

  @doc """
  Prints out Starting Indexes for Lucas Square Pyramid given `N` and `k`
  """
  def lucas_square(n \\ 40, k \\ 24)
  def lucas_square(n, k) when n <=0 or k<=0 or n < k do
    "Invalid Inputs"
  end
  def lucas_square(n, k) when n > 0 and k >0 do
    for i <- 1..n do
      # TODO Remove Logging 
      # IO.puts(Kernel.inspect(i) <> " " <> Kernel.inspect(i+k-1) <> " "<> Kernel.inspect(square_sum(i,i+k-1)) <> " " <> Kernel.inspect(:math.sqrt(square_sum(i, i + k - 1))))
      if is_square?(square_sum(i,i+k-1)) do
        IO.puts(i)
      end 
    end
    :ok
  end
  @doc """
  Sums up squares of numbers from `f` to `l`
  """
  def square_sum(f,l) when f > l do
    0
  end
  def square_sum(f,l) when f <= l do
    l * l + square_sum(f, l - 1)
  end 
  @doc """
  Checks whether input `n` is a perfect square or not
  """
  def is_square?(n) when n===0 or n===1 do
    true
  end
  def is_square?(n, f \\ 1, l \\ 0) when n > 1 do
    l = if l === 0 do n else l end  
    mid = div(f + l, 2)
    cond do
      f > l -> false
      mid * mid === n -> true
      mid * mid < n -> is_square?(n, mid + 1, l)
      mid * mid > n -> is_square?(n, f, mid - 1)
    end
  end
  # TODO Remove this
  def hello do
    :world
  end
end
