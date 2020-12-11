defmodule AdventOfCode.Day09Test do
  use ExUnit.Case

  import AdventOfCode.Day09

  test "example 1" do
    input = "35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
"

    assert 127 == part1([input, 5])
    assert 62 == part2({input, 127})
  end

  test "part1" do
    input = File.read!("./lib/advent_of_code/09_input.txt")

    assert 23_278_925 == part1([input, 25])
  end

  test "part2" do
    input = File.read!("./lib/advent_of_code/09_input.txt")

    assert 4_011_064 == part2({input, 23_278_925})
  end
end
