# https://adventofcode.com/2021/day/6#part2

file = File.read("input.txt")
timers = file.strip.split(",").map(&:to_i)

len = 9
timer_statuses = Array.new(len, 0)

timers.each { |timer| timer_statuses[timer] += 1 }

256.times do
    new_statuses = timer_statuses.clone
    len.times do |i|
        if i < 8
            new_statuses[i] = new_statuses[i + 1]
        else
            new_statuses[i] = timer_statuses[0]
            new_statuses[6] += timer_statuses[0]
        end
    end
    timer_statuses = new_statuses
end

num_of_timers = timer_statuses.reduce(0, :+)
puts "Result is #{num_of_timers}"
