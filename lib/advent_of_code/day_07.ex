defmodule AdventOfCode.Day07 do
  def part1(args) do
    args
    |> String.split(".", trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, " contain ", trim: true))
    |> Enum.map(&parse/1)
    |> Enum.filter(& &1)
    |> count(:"shiny gold")
    |> Map.get(:bags)
    |> Enum.uniq()
    |> length
  end

  def count({container, content}, %{bags: bags, target: target} = acc) do
    bags =
      acc.bags ++
        if Keyword.has_key?(content, target) do
          [container | count(acc.lines, container).bags]
        else
          []
        end

    %{acc | bags: bags}
  end

  def count(lines, target) do
    Enum.reduce(
      lines,
      %{bags: [], target: target, lines: lines},
      &count/2
    )
  end

  def part2(_args) do
  end

  defp parse([]), do: false

  defp parse([container, "no other bags"]),
    do: {
      container
      |> String.trim_trailing(" bags")
      |> String.to_atom(),
      []
    }

  defp parse([container, content]) do
    {
      container
      |> String.trim_trailing(" bags")
      |> String.to_atom(),
      content
      |> String.split(",")
      |> Enum.map(&Regex.named_captures(~r/(?<n>\d+) (?<c>.*) bags?/, &1))
      |> Enum.map(&Map.update!(&1, "n", fn x -> String.to_integer(x) end))
      |> Enum.map(&Map.update!(&1, "c", fn x -> String.to_atom(x) end))
      |> Enum.map(&List.to_tuple(Map.values(&1)))
    }
  end
end
