defmodule AdventOfCode2021.Day1 do
  def a([_h | tail] = depths) do
    Enum.zip(tail, depths)
    |> Enum.reduce(0, fn {b, a}, sum ->
      if b > a do
        sum + 1
      else
        sum
      end
    end)
  end

  def b([_h, two, three | rest] = depths) do
    triples = Enum.zip(Enum.zip([two, three | rest], depths), [three | depths])

    triples
    |> Enum.map(&tuple_sum/1)
    |> a()
  end

  defp tuple_sum({{a, b}, c}) do
    a + b + c
  end
end
