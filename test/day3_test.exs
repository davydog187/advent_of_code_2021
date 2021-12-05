defmodule AdventOfCode2021.Day3Test do
  use ExUnit.Case, async: true

  doctest AdventOfCode2021.Day3, import: true

  alias AdventOfCode2021.Day3

  @sample """
  00100
  11110
  10110
  10111
  10101
  01111
  00111
  11100
  10000
  11001
  00010
  01010
  """

  describe "part one" do
    test "sample" do
      assert Day3.a(@sample) == 198
    end

    test "real" do
      assert "./inputs/day3.txt" |> File.read!() |> Day3.a() == 4_139_586
    end
  end

  describe "part two" do
    setup do
      sample =
        @sample
        |> String.split("\n", trim: true)
        |> Enum.map(fn l -> l |> Day3.parse() |> List.to_tuple() end)

      real =
        "./inputs/day3.txt"
        |> File.read!()
        |> String.split("\n", trim: true)
        |> Enum.map(fn l -> l |> Day3.parse() |> List.to_tuple() end)

      %{sample: sample, real: real}
    end

    test "oxygen", %{sample: inputs} do
      assert Day3.find_rating(inputs, 0, &>=/2) == 23
    end

    test "scrubber", %{sample: inputs} do
      assert Day3.find_rating(inputs, 0, &</2) == 10
    end

    test "sample", %{sample: inputs} do
      assert Day3.b(inputs) == 230
    end

    test "real", %{real: inputs} do
      assert Day3.b(inputs) == 1_800_151
    end
  end

  test "to_binary" do
    assert Day3.to_binary([1, 1]) == 3
    assert Day3.to_binary([1, 1, 0]) == 6
  end
end
