defmodule AdventOfCode.Day06 do
  def part1(args) do
    args
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(
      &Enum.reduce(&1, %{}, fn
        "\n", acc -> acc
        a, acc -> Map.put(acc, a, true)
      end)
    )
    |> Enum.map(&length(Map.keys(&1)))
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(
      &{
        Enum.count(&1, fn c -> c == "\n" end) + 1,
        Enum.filter(&1, fn c -> c != "\n" end)
      }
    )
    |> Enum.map(fn {group_size, answers} ->
      {
        group_size,
        Enum.reduce(answers,%{}, &Map.update(&2,&1,1, fn v->v+1 end))
      }
    end)
    |> Enum.map(fn  {group_size, answers} ->
        Enum.count(answers, fn {_,v}-> v == group_size end)
    end)
    |> Enum.sum()
  end
end
