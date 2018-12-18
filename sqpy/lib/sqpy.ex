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
      Task.start_link(fn -> Worker.validate_sq_py(i, i + k - 1, parent) end)
    end
    lucas_helper(n,upper + 1,k)
  end

  @doc """
  Driver for Actor Initiation
  """
  def lucas_square(n, k) when n > 0 and k >0 do
    lucas_helper(n, 1, k)
  end
end