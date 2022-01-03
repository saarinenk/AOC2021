# https://adventofcode.com/2021/day/11

file = File.read("input.txt")
@data = file.strip.split.map { |line| line.chars.map(&:to_i) }
@height = @data.length
@width = @data[0].length

@times_flashed = 0

def flash(line, row)
    @data[line][row] = 0
    @times_flashed += 1

    (([0, line - 1].max)..([line + 1, @height - 1].min)).each do |r|
        (([0, row - 1].max)..([row + 1, @width - 1].min)).each do |c|
            next if @data[r][c].zero?

            @data[r][c] += 1
        end
    end
end

100.times do
    (0..@height - 1).each do |row|
        (0..@width - 1).each do |col|
            @data[row][col] += 1
        end
    end

    while @data.any? { |arr| arr.any? { |num| num > 9 } }
        (0..@height - 1).each do |row|
            (0..@width - 1).each do |col|
                next unless @data[row][col] > 9

                flash(row, col)
            end
        end
    end
end

puts @times_flashed
