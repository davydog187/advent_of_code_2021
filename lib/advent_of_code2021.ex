defmodule AdventOfCode2021 do
  @moduledoc """
  Documentation for `AdventOfCode2021`.
  """

  def parse_ints(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
