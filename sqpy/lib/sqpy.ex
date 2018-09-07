defmodule SqPy do
  @moduledoc """
  Documentation for SqPy.
  """

  @doc """
  Prints out Starting Indexes for Lucas Square Pyramid given `N` and `k`
  """
  def lucas_square(N, k) when N <=0 or k<=0 do
    "Invalid Inputs"
  end
  def lucas_square(N,k) when N > 0 and k >0 do
    for i <- 1..N do
      s = 0 
      for j <- i..i+k do
        s += j * j 
      end
      if is_square?(s) do
        IO.puts(i)
      end 
    end
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
