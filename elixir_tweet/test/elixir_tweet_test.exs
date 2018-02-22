defmodule ElixirTweetTest do
  use ExUnit.Case
  doctest ElixirTweet

  test "greets the world" do
    assert ElixirTweet.hello() == :world
  end
end
