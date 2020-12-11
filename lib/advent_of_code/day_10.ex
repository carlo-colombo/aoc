defmodule AdventOfCode.Day10 do
  def part1(args) do
    {c1, c3} =
      args
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort()
      |> count({0, 0})

    (c1 + 1) * (c3 + 1)
  end

  defp count([_], acc), do: acc

  defp count([a | [b | l]], {c1, c3}) do
    acc =
      case b - a do
        1 -> {c1 + 1, c3}
        2 -> {c1, c3}
        3 -> {c1, c3 + 1}
      end

    count([b | l], acc)
  end

  def part2(args) do
  end
end
