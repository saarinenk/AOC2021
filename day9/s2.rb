# https://adventofcode.com/2021/day/9

file = File.read("input.txt")
data = file.strip.split("\n").map { |line| line.chars.map(&:to_i) }
@visited = Marshal.load(Marshal.dump(data))

@height = data.length - 1
@width = data[0].length - 1
basins = []

def get_adjacents(array, row, column)
    prev = column.zero? ? nil : array[row][column - 1]
    nxt = column == @width ? nil : array[row][column + 1]
    prev_row = row.zero? ? nil : array[row - 1][column]
    next_row = row == @height ? nil : array[row + 1][column]
    [prev, nxt, prev_row, next_row]
end

def nil_or_nine?(num)
    num.nil? || num == 9
end

def count_basin(row, column)
    size = 0
    (prev, nxt, prev_row, next_row) = get_adjacents(@visited, row, column)

    if nil_or_nine?(@visited[row][column])
        return size
    end

    @visited[row][column] = nil

    size += 1

    unless nil_or_nine?(prev)
        size += count_basin(row, column - 1)
    end

    unless nil_or_nine?(nxt)
        size += count_basin(row, column + 1)
    end

    unless nil_or_nine?(prev_row)
        size += count_basin(row - 1, column)
    end

    unless nil_or_nine?(next_row)
        size += count_basin(row + 1, column)
    end
    size
end

(0..@height).each do |row|
    data[row].each_with_index do |num, i|
        (prev, nxt, prev_row, next_row) = get_adjacents(data, row, i)

        next unless (prev.nil? || num < prev) && (nxt.nil? || num < nxt) &&
                    (next_row.nil? || num < next_row) && (prev_row.nil? || num < prev_row)

        size = count_basin(row, i)
        basins.append(size)
    end
end

largest_basins_product = basins.sort.last(3).reduce(:*)

puts "Result is #{largest_basins_product}"
