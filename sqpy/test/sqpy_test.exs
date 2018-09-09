defmodule SqPyTest do
  use ExUnit.Case
  doctest SqPy

  test "check if 25 is square or not" do
    assert SqPy.is_square?(25) === true
  end

  test "check if 24 is square or not" do
    assert SqPy.is_square?(24) === false
  end

  test "square sum logic incorrect args" do
    assert SqPy.square_sum(5,3) === 0
  end 

  # 3*3 + 4*4 + 5*5 = 50
  test "square sum logic correct args" do
    assert SqPy.square_sum(3,5) === 50
  end

  test "lucas square for valid args" do
    assert SqPy.lucas_square(4,2) === 3
  end

end
