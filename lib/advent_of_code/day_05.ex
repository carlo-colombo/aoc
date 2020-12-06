defmodule AdventOfCode.Day05 do
  def part1(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(&calc/1)
    |> Enum.max()
  end

  def part2(args) do
    passes =
      args
      |> String.split("\n", trim: true)
      |> Enum.map(&calc/1)
      |> Enum.sort()

    try do
      for i <- 0..length(passes) do
        if not (Enum.at(passes, i) + 1 == Enum.at(passes, i + 1)) do
          throw(Enum.at(passes, i))
        end
      end
    catch
      v -> v + 1
    end
  end

  def calc(pass) do
    {id, ""} =
      pass
      |> String.split("", trim: true)
      |> Enum.map(fn
        "B" -> "1"
        "F" -> "0"
        "R" -> "1"
        "L" -> "0"
      end)
      |> Enum.join()
      |> Integer.parse(2)

    id
  end
end
