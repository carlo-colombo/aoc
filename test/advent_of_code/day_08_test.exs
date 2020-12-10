defmodule AdventOfCode.Day08Test do
  use ExUnit.Case

  import AdventOfCode.Day08

  test "example 1" do
    input = "nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
"

    assert 5 == part1(input)
  end

  test "part1" do
    input = File.read!("./lib/advent_of_code/08_input.txt")

    assert 1200 == part1(input)
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
