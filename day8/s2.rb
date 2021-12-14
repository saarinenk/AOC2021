# https://adventofcode.com/2021/day/8#part2

# 0:      1:      2:      3:      4:
# aaaa    ....    aaaa    aaaa    ....
# b    c  .    c  .    c  .    c  b    c
# b    c  .    c  .    c  .    c  b    c
# ....    ....    dddd    dddd    dddd
# e    f  .    f  e    .  .    f  .    f
# e    f  .    f  e    .  .    f  .    f
# gggg    ....    gggg    gggg    ....

#  5:      6:      7:      8:      9:
# aaaa    aaaa    aaaa    aaaa    aaaa
# b    .  b    .  .    c  b    c  b    c
# b    .  b    .  .    c  b    c  b    c
# dddd    dddd    ....    dddd    dddd
# .    f  e    f  .    f  e    f  .    f
# .    f  e    f  .    f  e    f  .    f
# gggg    gggg    ....    gggg    gggg

file = File.read("input.txt")
data = file.strip.split("\n").map { |line| line.split(" | ") }

sum = 0

data.each do |line|
    all_patterns = line[0].split

    one = all_patterns.find { |str| str.length == 2 }.chars
    four = all_patterns.find { |str| str.length == 4 }.chars

    output = ""

    line[1].split.each do |str|
        output +=
            case str.length
            when 2
                "1"
            when 3
                "7"
            when 4
                "4"
            when 5
                if (one - str.chars).empty?
                    "3"
                elsif (four - str.chars).length == 1
                    "5"
                else
                    "2"
                end
            when 6
                if (four - str.chars).empty?
                    "9"
                elsif (one - str.chars).empty?
                    "0"
                else
                    "6"
                end
            else
                "8"
            end
    end

    sum += output.to_i
end

p sum
