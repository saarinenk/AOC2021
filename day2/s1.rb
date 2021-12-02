file = File.open("input.txt")
commands = file.map(&:chomp)
grouped_by_dir = commands.group_by { |c| c.split(" ")[0] }
grouped_by_dir.transform_values! { |val| val.map { |c| c.split(" ")[1].to_i }.inject(0) { |sum, x| sum + x } }
horizontal = grouped_by_dir["forward"]
depth = grouped_by_dir["down"] - grouped_by_dir["up"]
puts "Result is #{horizontal * depth}"
file.close
