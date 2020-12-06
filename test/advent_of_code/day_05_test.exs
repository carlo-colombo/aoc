defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  test "part1" do
    input = File.read!("./lib/advent_of_code/05_input.txt")

    assert 801 == part1(input)
  end

  test "part2" do
    input = File.read!("./lib/advent_of_code/05_input.txt")

    assert 597 == part2(input)
  end

  test "examples" do
    assert 567 == calc("BFFFBBFRRR")
    assert 119 == calc("FFFBBBFRRR")
    assert 820 == calc("BBFFBBFRLL")
  end
end
