defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  test "example 1" do
    assert 11 == part1("abc

a
b
c

ab
ac

a
a
a
a

b")
  end

  test "part1" do
    input = File.read!("./lib/advent_of_code/06_input.txt")

    assert 6565 == part1(input)
  end

  test "example 2" do
    assert 6 == part2("

abc

a
b
c

ab
ac

a
a
a
a

b

")
  end

  test "part2" do
    input = File.read!("./lib/advent_of_code/06_input.txt")

    assert 3136 == part2(input)
  end
end
