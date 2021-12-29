# https://adventofcode.com/2021/day/9

file = File.read("input.txt")
data = file.strip.split("\n").map { |line| line.chars.map(&:to_i) }

low_point_sum = 0

height = data.length - 1

(0..height).each do |row|
    data[row].each_with_index do |num, i|
        prev = data[row][i - 1]
        nxt = data[row][i + 1]
        prev_row = row.zero? ? nil : data[row - 1][i]
        next_row = row == height ? nil : data[row + 1][i]
        if (prev.nil? || num < prev) && (nxt.nil? || num < nxt) && (next_row.nil? || num < next_row) && (prev_row.nil? || num < prev_row)
            low_point_sum += (num + 1)
        end
    end
end

puts "Result is #{low_point_sum}"
