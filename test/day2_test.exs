defmodule AdventOfCode2021.Day2Test do
  use ExUnit.Case, async: true

  alias AdventOfCode2021.Day2

  describe "part one" do
    test "sample" do
      input = """
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
      """

      assert Day2.a(input) == 150
    end

    test "real" do
      input = File.read!("./inputs/day2a.txt")

      assert Day2.a(input) == 1_383_564
    end
  end

  describe "part two" do
    test "sample" do
      input = """
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
      """

      assert Day2.b(input) == 900
    end

    test "real" do
      input = File.read!("./inputs/day2a.txt")

      assert Day2.b(input) == 1_488_311_643
    end
  end
end
