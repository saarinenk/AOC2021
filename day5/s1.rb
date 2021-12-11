file = File.open("input.txt")
data = file.map(&:chomp).map { |pair| pair.split(" -> ") }

height = data.flatten.map { |n| n.split(",")[0].to_i }.max
width = data.flatten.map { |n| n.split(",")[1].to_i }.max

diagram = Array.new(height + 1) { Array.new(width + 1) }

data = data.map { |coords| coords.map { |n| n.split(",").map(&:to_i) } }

data.each do |coords|
    xs = [coords[0][0], coords[1][0]]
    ys = [coords[0][1], coords[1][1]]
    if xs[0] == xs[1]
        range = (ys.min..ys.max).to_a
        range.each do |y|
            diagram[y][xs[0]] = diagram[y][xs[0]] ? diagram[y][xs[0]] + 1 : 1
        end
    elsif ys[0] == ys[1]
        range = (xs.min..xs.max).to_a
        range.each do |x|
            diagram[ys[0]][x] = diagram[ys[0]][x] ? diagram[ys[0]][x] + 1 : 1
        end
    end
end

num_of_overlaps = diagram.flatten.filter { |e| e && e.to_i > 1 }.length
puts "Result is #{num_of_overlaps}"

file.close
