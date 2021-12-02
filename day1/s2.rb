file = File.open("input.txt")
depths = file.map(&:to_i)
increase = 0
prev_sum = 0
depths.each_with_index do |_depth, i|
    next unless i > 2

    window = depths[i - 2] + depths[i - 1] + depths[i]
    increase += 1 if window.to_i > prev_sum.to_i
    prev_sum = window
end
puts "Result is #{increase}"
file.close
