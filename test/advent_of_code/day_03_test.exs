defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  test "example 1" do
    input = """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """

    result = part1(input)

    assert 7 == result
  end

  test "part1" do
    input = File.read!("./lib/advent_of_code/03_input.txt")
    result = part1(input)

    assert 259 == result
  end

  test "part2" do
    input = File.read!("./lib/advent_of_code/03_input.txt")

    assert 2_224_913_600 = part2(input)
  end

  test "example 2" do
    input = """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """

    assert 2 = part(input, 1, 1)
    assert 7 = part(input, 1, 3)
    assert 3 = part(input, 1, 5)
    assert 4 = part(input, 1, 7)
    assert 2 = part(input, 2, 1)
  end
end
