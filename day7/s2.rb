# https://adventofcode.com/2021/day/7#part2

file = File.read("input.txt")
positions = file.strip.split(",").map(&:to_i)

lowest_fuel = 0

(positions.min..positions.max).each do |possible_pos|
    current_fuel = 0
    positions.each do |pos|
        distance = (pos - possible_pos).abs
        current_fuel += Array(1..distance).reduce(0, :+)
    end

    if lowest_fuel.zero? || current_fuel < lowest_fuel
        lowest_fuel = current_fuel
    end
end

puts "Lowest fuel #{lowest_fuel}"
