defmodule SqPyTest do
  use ExUnit.Case
  doctest SqPy

  test "greets the world" do
    assert SqPy.hello() == :world
  end
end
