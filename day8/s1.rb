# https://adventofcode.com/2021/day/8

file = File.read("input.txt")
data = file.strip.split("\n").map { |line| line.split(" | ")[1].split }.flatten

acceptable_lengths = [2, 3, 4, 7]
needed_numbers = data.filter { |string| acceptable_lengths.include?(string.length) }

puts "Result is #{needed_numbers.length}"
