file = File.open("input.txt")
numbers = file.map(&:chomp).map { |num| num.split("").map(&:to_i) }
sum_of_columns = numbers.transpose.map(&:sum)
gamma = sum_of_columns.map { |sum| sum > (numbers.length / 2) ? 1 : 0 }.join.to_i(2)
epsilon = ("1" * numbers[0].length).to_i(2) ^ gamma
puts "The result is #{gamma * epsilon}"
file.close
