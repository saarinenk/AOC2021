# https://adventofcode.com/2021/day/10

file = File.read("input.txt")
data = file.strip.split("\n").map(&:chars)

brackets = { "(" => ")", "{" => "}", "[" => "]", "<" => ">" }
points = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25_137 }

stack = []
resulting_points = 0

data.each do |line|
    line.each do |char|
        if brackets.keys.index(char)
            stack << char
        elsif brackets[stack.last] == char
            stack.pop
        else
            resulting_points += points[char]
            stack = []
            break
        end
    end
end

puts "Result is #{resulting_points}"
