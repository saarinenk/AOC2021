# https://adventofcode.com/2021/day/7

file = File.read("input.txt")
positions = file.strip.split(",").map(&:to_i)

# get median
sorted = positions.sort
len = sorted.length
median = (sorted[(len - 1) / 2] + sorted[len / 2]) / 2

needed_fuel = 0

positions.each do |pos|
    needed_fuel += (pos - median).abs
end

puts "Needed fuel #{needed_fuel}"
