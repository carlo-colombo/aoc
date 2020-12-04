defmodule AdventOfCode.Day03 do
  def part1(args), do: part(args, 1, 3)

  def part2(args) do
    part(args, 1, 1) *
      part(args, 1, 3) *
      part(args, 1, 5) *
      part(args, 1, 7) *
      part(args, 2, 1)
  end

  defp detect("."), do: 0
  defp detect("#"), do: 1

  def part(args, down, right) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.reduce({0, right, right, down, down}, &reducer/2)
    |> elem(0)
  end

  def reducer(row, {c, i, right, down, 0}) when i >= length(row) do
    reducer(row, {c, rem(i, length(row)), right, down, 0})
  end

  def reducer(row, {c, i, right, down, 0}) do
    {c + detect(Enum.at(row, i)), i + right, right, down, down - 1}
  end

  def reducer(_, {c, i, right, down, d}) do
    {c, i, right, down, d - 1}
  end
end
