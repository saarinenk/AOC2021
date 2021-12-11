# https://adventofcode.com/2021/day/6

file = File.read("input.txt")
timers = file.strip.split(",").map(&:to_i)

80.times do
    new = 0
    timers.map! do |timer|
        if timer.zero?
            new += 1
            6
        else
            (timer - 1)
        end
    end
    timers.concat(Array.new(new, 8))
end

puts "Result is #{timers.length}"
