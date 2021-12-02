defmodule AdventOfCode2021.Day1Test do
  use ExUnit.Case, aysnc: true
  alias AdventOfCode2021.Day1

  import AdventOfCode2021

  describe "part one" do
    test "sample input" do
      input =
        """
        199
        200
        208
        210
        200
        207
        240
        269
        260
        263
        """
        |> parse_ints()

      assert Day1.a(input) == 7
    end

    test "real" do
      input = File.read!("./inputs/day1a.txt") |> parse_ints

      assert Day1.a(input) == 1475
    end
  end

  describe "part two" do
    test "sample input" do
      input =
        """
        199
        200
        208
        210
        200
        207
        240
        269
        260
        263
        """
        |> parse_ints()

      assert Day1.b(input) == 5
    end

    test "real" do
      input = File.read!("./inputs/day1a.txt") |> parse_ints

      assert Day1.b(input) == 1516
    end
  end
end
