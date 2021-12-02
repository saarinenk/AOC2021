file = File.open("input.txt")
commands = file.map(&:chomp)
aim = 0
horizontal = 0
depth = 0
commands.each do |c|
    arr = c.split
    dir = arr[0]
    val = arr[1].to_i

    case dir
    when "down"
        aim += val
    when "up"
        aim -= val
    else
        horizontal += val
        depth += val * aim
    end
end
puts "Result is #{horizontal * depth}"
file.close
