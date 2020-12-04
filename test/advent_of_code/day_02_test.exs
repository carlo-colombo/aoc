defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  doctest AdventOfCode.Day02

  import AdventOfCode.Day02

  test "example" do
    assert 3 == part1("
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
10-10 a: aaaaaaaaaa
")
  end

  test "example2" do
    assert 1 == part2("
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
")
  end

  test "part1" do
    input = File.read!("./lib/advent_of_code/02_input.txt")
    result = part1(input)

    assert 580 == result
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
