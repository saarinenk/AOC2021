# https://adventofcode.com/2021/day/13

file = File.read("input.txt")
data = file.strip.split("\n\n")

coords = data[0].split("\n").map { |pair| pair.split(",").map(&:to_i) }
folds = data[1].split("\n").map { |fold| fold.split("fold along ")[1] }

width = coords.map { |pair| pair[0] }.max
height = coords.map { |pair| pair[1] }.max

diagram = Array.new(height + 1) { Array.new(width + 1) }

coords.each do |coord|
    x = coord[0]
    y = coord[1]
    diagram[y][x] = "#"
end

(axis, pos) = folds[0].split("=")
pos = pos.to_i

diagram.each_with_index do |row, iy|
    row.each_with_index do |col, ix|
        if axis == "x"
            if col == "#" && ix > pos
                diagram[iy][pos - (ix - pos)] = "#"
            end
        elsif col == "#" && iy > pos
            diagram[pos - (iy - pos)][ix] = "#"
        end
    end
end

diagram = axis == "x" ? diagram.map { |arr| arr.take(pos + 1) } : diagram.take(pos + 1)

p diagram.flatten.reject(&:nil?).length
