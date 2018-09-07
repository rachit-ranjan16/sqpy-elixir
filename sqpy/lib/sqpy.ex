defmodule SqPy do
  @moduledoc """
  Documentation for SqPy.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SqPy.hello()
      :world

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
