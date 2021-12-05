defmodule AdventOfCode2021.Day3 do
  import Bitwise

  def a(input) do
    inputs =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&parse/1)

    [first | _] = inputs

    counts =
      Enum.reduce(inputs, zero(first), fn binary, count ->
        sum(binary, count)
      end)

    {gamma, epsilon} = calculate(counts, Enum.count(inputs))

    to_binary(gamma) * to_binary(epsilon)
  end

  def b(inputs) do
    oxygen = find_rating(inputs, 0, &>=/2)
    scrubber = find_rating(inputs, 0, &</2)

    oxygen * scrubber
  end

  def find_rating([input], _, _), do: input |> Tuple.to_list() |> to_binary()

  def find_rating(inputs, index, test) do
    {ones, zeroes} = Enum.split_with(inputs, fn l -> elem(l, index) == 1 end)

    inputs =
      if test.(length(ones), length(zeroes)) do
        ones
      else
        zeroes
      end

    find_rating(inputs, index + 1, test)
  end

  @doc """
  iex> sum([1, 2, 3], [2, 2, 2])
  [3, 4, 5]

  iex> sum([1, 2], [2, 2, 2])
  [3, 4]

  iex> sum([1, 2, 3], [2, 2])
  [3, 4]
  """
  def sum(a, b) do
    Enum.zip(a, b) |> Enum.map(&Tuple.sum/1)
  end

  @doc """
  iex> calculate([1, 2, 3], 3)
  {[0, 1, 1], [1, 0, 0]}
  """
  def calculate(values, count) do
    values
    |> Enum.map(fn val ->
      if val >= count / 2.0 do
        {1, 0}
      else
        {0, 1}
      end
    end)
    |> Enum.unzip()
  end

  @doc """
  iex> zero([1, 2, 3, 4, 5])
  [0, 0, 0, 0, 0]
  """
  def zero(list) do
    Enum.map(list, fn _ -> 0 end)
  end

  @doc """
  iex> to_binary([1])
  1

  iex> to_binary([1, 1])
  3

  iex> to_binary([1, 1, 0])
  6

  iex> to_binary([1, 0, 1])
  5

  iex> to_binary([0, 0, 0])
  0

  iex> to_binary([1, 1, 1])
  7

  iex> to_binary([1, 0, 1, 1, 0])
  22

  iex> to_binary([0, 1, 0, 0, 1])
  9
  """
  def to_binary(list) do
    to_binary(list, 0)
  end

  def to_binary([], num) do
    num
  end

  def to_binary([digit | list], num) do
    to_binary(list, (num <<< 1) + digit)
  end

  def parse(string), do: parse(string, [])
  def parse("", num), do: num |> Enum.reverse()

  def parse("0" <> rest, num) do
    parse(rest, [0 | num])
  end

  def parse("1" <> rest, num) do
    parse(rest, [1 | num])
  end
end
