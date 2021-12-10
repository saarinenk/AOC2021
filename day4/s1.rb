file = File.open("input.txt")
data = file.map(&:chomp)
numbers = data[0].split(",").map(&:to_i)
boards = data.drop(2)

boards = boards.map { |num| num.split.map(&:to_i) }.filter(&:any?).each_slice(5).to_a
all_rows = boards.map { |set| set.concat(set.transpose) }
winning_num = nil

numbers.each do |n|
    all_rows = all_rows.map { |board| board.map { |row| row.filter { |num| num != n } } }
    winning_num = n
    break if all_rows.any? { |board| board.any?(&:empty?) }
end

sum_of_remaining = all_rows.find { |board| board.find(&:empty?) }.slice(0, 5).flatten.sum
puts "Result is #{winning_num * sum_of_remaining}"

file.close
