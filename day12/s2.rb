# https://adventofcode.com/2021/day/12#part2

file = File.read("input.txt")
data = file.strip.split
@paths = {}

data.map do |path|
    (first, second) = path.split("-")
    if second != "start"
        @paths[first] = @paths[first] ? @paths[first].append(second) : [second]
    end
    if first != "start"
        @paths[second] = @paths[second] ? @paths[second].append(first) : [first]
    end
end

def small?(node)
    (node != node.upcase)
end

def find_paths(node, visited)
    path_count = 0
    route = visited.clone

    route_smalls = route.filter { |n| small?(n) }

    if node == "end"
        path_count += 1
        return path_count
    elsif small?(node) && route_smalls != route_smalls.uniq && route.include?(node)
        return path_count
    end
    route.append(node)

    @paths[node].each do |n|
        path_count += find_paths(n, route)
    end

    path_count
end

p find_paths("start", [])
