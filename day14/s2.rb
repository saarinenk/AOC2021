# https://adventofcode.com/2021/day/14#part2

file = File.read("test.txt")
data = file.strip.split("\n\n")

template = data[0]
rules = data[1].split("\n").map { |rule| rule.split(" -> ") }.to_h

@store = {}

def combine_results(a, b, letter)
    keys = a.keys.concat(b.keys).uniq
    res = {}
    keys.each do |key|
        res[key] = a.fetch(key, 0) + b.fetch(key, 0)
    end
    res[letter] -= 1
    res
end

def to_hash(pair)
    pair.chars.uniq.map { |v| [v, pair.chars.count(v)] }.to_h
end

def run_step(pair, rules, step)
    new_letter = rules[pair]
    key = "#{pair}-#{step}"
    if step == 40 || new_letter.nil?
        result = to_hash(pair)
        # storing the already calculated longer strings in the store
        # to not need to recalc them again
        @store[key] = result
        return result
    end

    if @store.key?(key)
        return @store[key]
    end

    a = run_step(
        pair[0] + new_letter,
        rules,
        step + 1
    )
    b = run_step(new_letter + pair[1], rules, step + 1)
    res = combine_results(a, b, new_letter)
    @store["#{pair}-#{step}"] = res
    res
end

result = {}
# dividing string to overlapping pairs and looping through them
template.chars.each_cons(2).each do |pair|
    result = combine_results(result, run_step(pair.join, rules, 0), pair[0])
end
p "result is #{result.values.max - result.values.min}"
