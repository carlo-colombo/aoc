defmodule AdventOfCode.Day11 do
  def part1(args) do
    matrix =
      args
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, "", trim: true))
      |> iterate
      |> Enum.flat_map(& &1)
      |> Enum.count(&(&1 == "#"))
  end

  defp iterate(m) do
    nm =
      for {row, i} <- Enum.with_index(m) do
        for {cell, j} <- Enum.with_index(row) do
          c = count(m, i, j)

          cond do
            cell == "L" && c == 0 ->
              "#"

            cell == "#" && c >= 4 ->
              "L"

            true ->
              cell
          end
        end
      end

    # IO.puts("--------------")
    # IO.puts(nm |> Enum.map(&Enum.join(&1, "")) |> Enum.join("\n"))
    # IO.puts("--------------")

    if m == nm, do: m, else: iterate(nm)
  end

  def matrix() do
    "#.##.##.##
#######.##
#.#.#..#..
####.##.##
#.##.##.##
#.#####.##
..#.#.....
##########
#.######.#
#.#####.##"
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
  end

  def count(m, i, j) do
    for x <- -1..1, y <- -1..1, !(x == 0 && y == 0) do
      x = i + x
      y = j + y

      if x >= 0 && y >= 0 do
        try do
          cell = get_in(m, [Access.at(x), Access.at(y)])

          case cell do
            "#" -> 1
            _ -> 0
          end
        rescue
          _ -> 0
        end
      else
        0
      end
    end
    |> Enum.sum()
  end

  def part2(args) do
  end
end
