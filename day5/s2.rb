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
    else
        range_x = xs[0] < xs[1] ? (xs[0]..xs[1]).to_a : xs[0].downto(xs[1]).to_a
        range_y = ys[0] < ys[1] ? (ys[0]..ys[1]).to_a : ys[0].downto(ys[1]).to_a

        range_x.length.times do |i|
            point = diagram[range_y[i]][range_x[i]]
            diagram[range_y[i]][range_x[i]] = point ? point + 1 : 1
        end

    end
end

num_of_overlaps = diagram.flatten.filter { |e| e && e.to_i > 1 }.length
puts "Result is #{num_of_overlaps}"

file.close
