defmodule SqPy do
  @moduledoc """
  Documentation for SqPy.
  """
  @worker_load 100000
  @doc """
  Driver Method
  """
  def main(args) when Kernel.length(args) != 2 do
    raise ArgumentError, message: "Insfficient/Excess Arguments. Enter N and k"
  end

  def main(args) do
    if String.to_integer(Enum.at(args,0)) < String.to_integer(Enum.at(args,1)) do 
      input_error "Invalid Inputs"
    end 
    lucas_square(String.to_integer(Enum.at(args,0)), String.to_integer(Enum.at(args,1)))
    :timer.sleep 1000
  end

  defp input_error(msg) do
    raise ArgumentError, message: msg
  end

  @doc """
  Prints out Starting Indexes for Lucas Square Pyramid given `N` and `k`
  """
  def lucas_square(n \\ 40, k \\ 24)
  
  def lucas_square(n, k) when n <=0 or k<=0 do 
    input_error "Invalid Inputs"
  end

  @doc """
  Processes Messages returned to the parent from the actors 
  """
  def msg_proc() do 
    receive do 
      {:found, f} -> IO.puts f;
    end 
    msg_proc()
  end 

  @doc """
  Distributes work load between actors
  """
  def lucas_helper(n, lower, k) when lower > n do 
    end
  def lucas_helper(n,lower,k)  when lower <= n do
    {:ok, parent} = Task.start_link(fn -> msg_proc() end)
    upper = if lower+@worker_load < n do 
              lower+@worker_load
            else
              n 
            end 
    for i <- lower..upper do
      Task.start_link(fn -> validate_sq_py(i, i + k - 1, parent) end)
    end
    lucas_helper(n,upper + 1,k)
  end

  @doc """
  Driver for Actor Initiation
  """
  def lucas_square(n, k) when n > 0 and k >0 do
    lucas_helper(n, 1, k)
  end

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
