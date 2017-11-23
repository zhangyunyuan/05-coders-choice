defmodule CASTest do
  use ExUnit.Case
  doctest CAS

  test "greets the world" do
    assert CAS.hello() == :world
  end
end
