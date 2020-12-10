defmodule AdventOfCode.Day09 do
  def part1([args, n]) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> check(n)
  end

  def part2({args, target}) do
    numbers =
      args
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> find(target)
      |> Enum.sort()

    List.last(numbers) + List.first(numbers)
  end

  def check(numbers, n) do
    check(Enum.split(numbers, n))
  end

  def check({[_ | pb] = preamble, [h | rest]}) do
    for x <- preamble, y <- preamble, x != y do
      if x + y == h do
        throw({x, y, h})
      end
    end

    h
  catch
    res ->
      check({pb ++ [h], rest})
  end

  def find([h | rest], target), do: find([h], rest, target)
  def find(_, [], target), do: IO.inspect("fooofoffo")

  def find([hc | rc] = cont, [h | rest] = list, target) do
    if Enum.sum(cont) == target do
      cont
    else
      if Enum.sum(cont) > target do
        find(rc, list, target)
      else
        find(cont ++ [h], rest, target)
      end
    end
  end
end
