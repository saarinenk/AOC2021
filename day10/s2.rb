# https://adventofcode.com/2021/day/10#part2

file = File.read("input.txt")
data = file.strip.split("\n").map(&:chars)

brackets = { "(" => ")", "{" => "}", "[" => "]", "<" => ">" }
points = { ")" => 1, "]" => 2, "}" => 3, ">" => 4 }

stack = []
all_points = []

data.each do |line|
    stack = []
    line.each do |char|
        if brackets.keys.index(char)
            stack << char
        elsif brackets[stack.last] == char
            stack.pop
        else
            stack = []
            break
        end
    end
    next if stack.empty?

    stack_points = 0
    stack.reverse.each do |bracket|
        stack_points = (stack_points * 5) + points[brackets[bracket]]
    end
    all_points << stack_points
end

middle = all_points.sort[(all_points.length / 2)]

puts "Result is #{middle}"
