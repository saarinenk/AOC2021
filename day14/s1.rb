# https://adventofcode.com/2021/day/14

file = File.read("input.txt")
data = file.strip.split("\n\n")

template = data[0]
rules = data[1].split("\n").map { |rule| rule.split(" -> ") }.to_h

40.times do
    result = ""
    template.chars.each_with_index do |char, i|
        result += char
        next unless i != template.length - 1

        result += rules[char + template[i + 1]]
    end
    template = result
end

num_of_chars = template.chars.uniq.map { |v| [v, template.chars.count(v)] }.to_h
puts num_of_chars.values.max - num_of_chars.values.min
