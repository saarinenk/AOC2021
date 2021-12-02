file = File.open("input.txt")
depths = file.map(&:to_i)
increase = 0
depths.each_with_index do |depth, i|
    increase += 1 if i > 0 && depth > depths[i - 1]
end
puts "Result is #{increase}"
file.close
