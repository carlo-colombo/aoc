defmodule AdventOfCode.Day04 do
  def part1(args) do
    args
    |> prepare
    |> Enum.map(
      &Enum.reduce(&1, %{"cid" => "optional"}, fn
        f, acc -> reducer(f, acc)
      end)
    )
    |> Enum.map(&Map.keys(&1))
    |> Enum.map(&length/1)
    |> Enum.filter(&(&1 == 8))
    |> length
  end

  defp prepare(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce([""], fn
      "", acc -> ["" | acc]
      line, [h | t] -> [h <> " " <> line | t]
    end)
    |> Enum.map(&String.split(&1, " ", trim: true))
  end

  for f <- ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"] do
    def reducer(unquote(f) <> ":" <> v, acc), do: Map.put(acc, unquote(f), v)
  end

  def part2(args) do
  end
end
