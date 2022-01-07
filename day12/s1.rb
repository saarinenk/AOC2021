# https://adventofcode.com/2021/day/12

file = File.read("input.txt")
data = file.strip.split
@paths = {}

data.map do |path|
    (first, second) = path.split("-")
    @paths[first] = @paths[first] ? @paths[first].append(second) : [second]
    @paths[second] = @paths[second] ? @paths[second].append(first) : [first]
end

def small?(node)
    (node != node.upcase)
end

def find_paths(node, visited)
    path_count = 0
    route = visited.clone

    if node == "end"
        path_count += 1
        return path_count
    elsif small?(node) && route.include?(node)
        return path_count
    end
    route.append(node)

    possible_nodes = @paths[node] - route.filter { |n| small?(n) }

    possible_nodes.each do |n|
        path_count += find_paths(n, route)
    end

    path_count
end

p find_paths("start", [])
