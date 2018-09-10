 defmodule Worker do
     
 @doc """
  Sends message to the parent if valid lucas pyramid starting point has been found
  """
  def validate_sq_py(f,l, parent) do 
    if is_square?(square_sum(f,l)) do
      send(parent, {:found, f})
    end
  end  
  
  @doc """
  Sums up squares of numbers from `f` to `l`
  """
  def square_sum(f,l) when f<=0 or l<=0 or f > l do
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
end