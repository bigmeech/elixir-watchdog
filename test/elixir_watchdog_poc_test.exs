defmodule ElixirWatchdogPocTest do
  use ExUnit.Case
  doctest ElixirWatchdogPoc

  test "greets the world" do
    assert ElixirWatchdogPoc.hello() == :world
  end
end
