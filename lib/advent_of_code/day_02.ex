defmodule AdventOfCode.Day02 do
  @re ~r/(?<min>\d+)-(?<max>\d+) (?<c>[a-z]): (?<pwd>.*)/

  def part1(args), do: part(args, &validate/4)
  def part2(args), do: part(args, &validate2/4)

  @doc ~S"""
      iex> AdventOfCode.Day02.validate(1,3, "a", "abcde")
      true

      iex> AdventOfCode.Day02.validate(1,3, "b", "cdefg")
      false

      iex> AdventOfCode.Day02.validate(2,9, "c", "ccccccccc")
      true
  """
  def validate(min, max, c, pwd) do
    count =
      pwd
      |> String.split("", trim: true)
      |> Enum.filter(&(&1 == c))
      |> length

    count >= min && count <= max
  end

  @doc ~S"""
      iex> AdventOfCode.Day02.validate2(1,3, "a", "abcde")
      true

      iex> AdventOfCode.Day02.validate2(1,3, "b", "cdefg")
      false

      iex> AdventOfCode.Day02.validate2(2,9, "c", "ccccccccc")
      false
  """
  def validate2(min, max, c, pwd) do
    xor(String.at(pwd, min - 1) == c, String.at(pwd, max - 1) == c)
  end

  defp xor(true, false), do: true
  defp xor(false, true), do: true
  defp xor(_, _), do: false

  defp part(args, fun) do
    args
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&Regex.named_captures(@re, &1))
    |> Enum.filter(fn %{"min" => min, "max" => max, "c" => c, "pwd" => pwd} ->
      fun.(String.to_integer(min), String.to_integer(max), c, pwd)
    end)
    |> length
  end
end
