file = File.open("input.txt")
numbers = file.map(&:chomp).map { |num| num.split("").map(&:to_i) }

def remaining(remaining_numbers, index, epsilon = false)
    sum_of_column = remaining_numbers.transpose[index].sum
    comp = sum_of_column >= (remaining_numbers.length / 2.0) ? 1 : 0
    if epsilon
        comp = comp == 1 ? 0 : 1
    end
    remaining_numbers.clone.filter { |arr| arr[index] == (comp) }
end

remaining_gamma = numbers.clone
i = 0
while remaining_gamma.length > 1
    remaining_gamma = remaining(remaining_gamma, i)
    i += 1
end

remaining_epsilon = numbers.clone
i = 0
while remaining_epsilon.length > 1
    remaining_epsilon = remaining(remaining_epsilon, i, true)
    i += 1
end

gamma = remaining_gamma[0].join.to_i(2)
epsilon = remaining_epsilon[0].join.to_i(2)

puts "The result is #{gamma * epsilon}"

file.close
