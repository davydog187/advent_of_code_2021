defmodule AdventOfCode2021.Day2 do
  def a(input) do
    process(input, {0, 0}, fn {command, magnitude}, {x, y} ->
      case command do
        :forward -> {x + magnitude, y}
        :down -> {x, y + magnitude}
        :up -> {x, y - magnitude}
      end
    end)
    |> Tuple.product()
  end

  def b(input) do
    {x, y, _a} =
      process(input, {0, 0, 0}, fn {command, magnitude}, {x, y, aim} ->
        case command do
          :forward -> {x + magnitude, y + aim * magnitude, aim}
          :down -> {x, y, aim + magnitude}
          :up -> {x, y, aim - magnitude}
        end
      end)

    x * y
  end

  defp process(input, acc, func) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(acc, fn line, position ->
      line
      |> parse()
      |> func.(position)
    end)
  end

  defp parse("forward " <> val), do: parse(:forward, val)
  defp parse("down " <> val), do: parse(:down, val)
  defp parse("up " <> val), do: parse(:up, val)
  defp parse(command, val), do: {command, String.to_integer(val)}
end
