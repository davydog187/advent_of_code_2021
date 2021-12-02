defmodule AdventOfCode2021Test do
  use ExUnit.Case
  doctest AdventOfCode2021

  test "parse ints" do
    input = """
    1
    2
    3
    """

    assert AdventOfCode2021.parse_ints(input) == [1, 2, 3]
  end
end
