defmodule AdventOfCode.Day08 do
  def part1(args) do
    instructions =
      args
      |> String.trim()
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, " ", trim: true))
      |> Enum.map(fn [op, a] -> {op, String.to_integer(a), 0} end)

    exec(instructions, 0, 0)
  end

  defp exec(lines, acc, line) do
    instr = Enum.at(lines, line)
    lines = update_in(lines, [Access.at(line), Access.elem(2)], &(&1 + 1))

    case instr do
      {"nop", _, 0} -> exec(lines, acc, line + 1)
      {"jmp", a, 0} -> exec(lines, acc, line + a)
      {"acc", a, 0} -> exec(lines, acc + a, line + 1)
      _ -> acc
    end
  end

  def part2(args) do
  end
end
