# enumerable.cr: 79 examples

# enumerable.cr:9 (001.cr)
class Three
  include Enumerable(Int32)

  def each
    yield 1
    yield 2
    yield 3
  end
end

three = Three.new
three.to_a                # => [1, 2, 3]
three.select &.odd?       # => [1, 3]
three.all? { |x| x < 10 } # => true

# enumerable.cr:42 (002.cr)
["ant", "bear", "cat"].all? { |word| word.size >= 3 } # => true
["ant", "bear", "cat"].all? { |word| word.size >= 4 } # => false

# enumerable.cr:54 (003.cr)
[2, 3, 4].all?(1..5)        # => true
[2, 3, 4].all?(Int32)       # => true
[2, "a", 3].all?(String)    # => false
%w[foo bar baz].all?(/o|a/) # => true

# enumerable.cr:66 (004.cr)
[nil, true, 99].all? # => false
[15].all?            # => true

# enumerable.cr:77 (005.cr)
["ant", "bear", "cat"].any? { |word| word.size >= 4 } # => true
["ant", "bear", "cat"].any? { |word| word.size > 4 }  # => false

# enumerable.cr:89 (006.cr)
[2, 3, 4].any?(1..3)      # => true
[2, 3, 4].any?(5..10)     # => false
[2, "a", 3].any?(String)  # => true
%w[foo bar baz].any?(/a/) # => true

# enumerable.cr:101 (007.cr)
[nil, true, 99].any? # => true
[nil, false].any?    # => false

# enumerable.cr:116 (008.cr)
ary = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunks { |n| n.even? }
ary # => [{false, [3, 1]}, {true, [4]}, {false, [1, 5, 9]}, {true, [2, 6]}, {false, [5, 3, 5]}]

# enumerable.cr:220 (009.cr)
["Alice", "Bob"].map { |name| name.match(/^A./) }         # => [#<Regex::MatchData "Al">, nil]
["Alice", "Bob"].compact_map { |name| name.match(/^A./) } # => [#<Regex::MatchData "Al">]

# enumerable.cr:238 (010.cr)
[1, 2, 3, 4].count { |i| i % 2 == 0 } # => 2

# enumerable.cr:249 (011.cr)
[1, 2, 3, 4].count(3) # => 1

# enumerable.cr:269 (012.cr)
[1, 2, 3, 4, 5].each_cons(2) do |cons|
  puts cons
end

# enumerable.cr:319 (013.cr)
[1, 2, 3, 4, 5].each_slice(2) do |slice|
  puts slice
end

# enumerable.cr:375 (014.cr)
["Alice", "Bob"].each_with_index do |user, i|
  puts "User ##{i}: #{user}"
end

# enumerable.cr:391 (015.cr)
["Alice", "Bob"].each_with_index(1) do |user, i|
  puts "User ##{i}: #{user}"
end

# enumerable.cr:414 (016.cr)
hash = ["Alice", "Bob"].each_with_object({} of String => Int32) do |user, sizes|
  sizes[user] = user.size
end
hash # => {"Alice" => 5, "Bob" => 3}

# enumerable.cr:432 (017.cr)
[1, 2, 3, 4].find { |i| i > 2 }     # => 3
[1, 2, 3, 4].find { |i| i > 8 }     # => nil
[1, 2, 3, 4].find(-1) { |i| i > 8 } # => -1

# enumerable.cr:461 (018.cr)
array = ["Alice", "Bob"].flat_map do |user|
  user.chars
end
array # => ['A', 'l', 'i', 'c', 'e', 'B', 'o', 'b']

# enumerable.cr:483 (019.cr)
["Alice", "Bob"].grep(/^A/) # => ["Alice"]

# enumerable.cr:494 (020.cr)
["Alice", "Bob", "Ary"].group_by { |name| name.size } # => {5 => ["Alice"], 3 => ["Bob", "Ary"]}

# enumerable.cr:513 (021.cr)
[1, 2, 3].in_groups_of(2, 0) # => [[1, 2], [3, 0]]
[1, 2, 3].in_groups_of(2)    # => [[1, 2], [3, nil]]

# enumerable.cr:529 (022.cr)
[1, 2, 4].in_groups_of(2, 0) { |e| p e.sum }
# => 3
# => 4

# enumerable.cr:553 (023.cr)
[1, 2, 3].includes?(2) # => true
[1, 2, 3].includes?(5) # => false

# enumerable.cr:563 (024.cr)
["Alice", "Bob"].index { |name| name.size < 4 } # => 1 (Bob's index)

# enumerable.cr:577 (025.cr)
["Alice", "Bob"].index("Alice") # => 0

# enumerable.cr:592 (026.cr)
["Anna", "Ary", "Alice"].index_by { |e| e.size }
# => {4 => "Anna", 3 => "Ary", 5 => "Alice"}
["Anna", "Ary", "Alice", "Bob"].index_by { |e| e.size }
# => {4 => "Anna", 3 => "Bob", 5 => "Alice"}

# enumerable.cr:613 (027.cr)
[1, 2, 3, 4, 5].reduce { |acc, i| acc + i } # => 15

# enumerable.cr:630 (028.cr)
[1, 2, 3, 4, 5].reduce(10) { |acc, i| acc + i } # => 25

# enumerable.cr:643 (029.cr)
[1, 2, 3, 4, 5].join(", ") # => "1, 2, 3, 4, 5"

# enumerable.cr:655 (030.cr)
[1, 2, 3, 4, 5].join(", ") { |i| -i } # => "-1, -2, -3, -4, -5"

# enumerable.cr:668 (031.cr)
[1, 2, 3, 4, 5].join(", ", STDOUT)

# enumerable.cr:686 (032.cr)
[1, 2, 3, 4, 5].join(", ", STDOUT) { |i, io| io << "(#{i})" }

# enumerable.cr:704 (033.cr)
[1, 2, 3].map { |i| i * 10 } # => [10, 20, 30]

# enumerable.cr:715 (034.cr)
["Alice", "Bob"].map_with_index { |name, i| "User ##{i}: #{name}" }
# => ["User #0: Alice", "User #1: Bob"]

# enumerable.cr:729 (035.cr)
[1, 2, 3].max        # => 3
["Alice", "Bob"].max # => "Bob"

# enumerable.cr:748 (036.cr)
["Alice", "Bob"].max_by { |name| name.size } # => "Alice"

# enumerable.cr:784 (037.cr)
["Alice", "Bob"].max_of { |name| name.size } # => 5 (Alice's size)

# enumerable.cr:818 (038.cr)
[1, 2, 3].min        # => 1
["Alice", "Bob"].min # => "Alice"

# enumerable.cr:837 (039.cr)
["Alice", "Bob"].min_by { |name| name.size } # => "Bob"

# enumerable.cr:873 (040.cr)
["Alice", "Bob"].min_of { |name| name.size } # => 3 (Bob's size)

# enumerable.cr:905 (041.cr)
[1, 2, 3].minmax # => {1, 3}

# enumerable.cr:921 (042.cr)
["Alice", "Bob", "Carl"].minmax_by { |name| name.size } # => {"Bob", "Alice"}

# enumerable.cr:964 (043.cr)
["Alice", "Bob", "Carl"].minmax_of { |name| name.size } # => {3, 5}

# enumerable.cr:1003 (044.cr)
[1, 2, 3].none? { |i| i > 5 } # => true

# enumerable.cr:1016 (045.cr)
[2, 3, 4].none?(5..7)      # => true
[2, "a", 3].none?(String)  # => false
%w[foo bar baz].none?(/e/) # => true

# enumerable.cr:1027 (046.cr)
[nil, false].none?       # => true
[nil, false, true].none? # => false

# enumerable.cr:1040 (047.cr)
[1, 2, 3].one? { |i| i > 2 } # => true
[1, 2, 3].one? { |i| i > 1 } # => false

# enumerable.cr:1056 (048.cr)
[1, 10, 100].one?(7..14)   # => true
[2, "a", 3].one?(Int32)    # => false
%w[foo bar baz].one?(/oo/) # => true

# enumerable.cr:1068 (049.cr)
[1, false, false].one? # => true
[1, false, 3].one?     # => false
[1].one?               # => true
[false].one?           # => false

# enumerable.cr:1082 (050.cr)
[1, 2, 3, 4, 5, 6].partition { |i| i % 2 == 0 } # => {[2, 4, 6], [1, 3, 5]}

# enumerable.cr:1097 (051.cr)
[1, 2, 3, 4, 5, 6].reject { |i| i % 2 == 0 } # => [1, 3, 5]

# enumerable.cr:1109 (052.cr)
ints = [1, true, 3, false].reject(Bool)
ints         # => [1, 3]
typeof(ints) # => Array(Int32)

# enumerable.cr:1126 (053.cr)
[1, 3, 2, 5, 4, 6].reject(3..5).should eq([1, 2, 6])

# enumerable.cr:1136 (054.cr)
[1, 2, 3, 4, 5, 6].select { |i| i % 2 == 0 } # => [2, 4, 6]

# enumerable.cr:1148 (055.cr)
ints = [1, true, nil, 3, false].select(Int32)
ints         # => [1, 3]
typeof(ints) # => Array(Int32)

# enumerable.cr:1162 (056.cr)
[1, 3, 2, 5, 4, 6].select(3..5).should eq([3, 5, 4])

# enumerable.cr:1171 (057.cr)
[1, 2, 3, 4].size # => 4

# enumerable.cr:1183 (058.cr)
[1, 2, 3, 4, 5, 6].skip(3) # => [4, 5, 6]

# enumerable.cr:1200 (059.cr)
[1, 2, 3, 4, 5, 0].skip_while { |i| i < 3 } # => [3, 4, 5, 0]

# enumerable.cr:1218 (060.cr)
[1, 2, 3, 4, 5, 6].sum # => 21

# enumerable.cr:1224 (061.cr)
([] of Int32).sum # => 0

# enumerable.cr:1239 (062.cr)
[1, 2, 3, 4, 5, 6].sum(7) # => 28

# enumerable.cr:1245 (063.cr)
([] of Int32).sum(7) # => 7

# enumerable.cr:1254 (064.cr)
["Alice", "Bob"].sum { |name| name.size } # => 8 (5 + 3)

# enumerable.cr:1260 (065.cr)
([] of Int32).sum { |x| x + 1 } # => 0

# enumerable.cr:1271 (066.cr)
["Alice", "Bob"].sum(1) { |name| name.size } # => 9 (1 + 5 + 3)

# enumerable.cr:1277 (067.cr)
([] of String).sum(1) { |name| name.size } # => 1

# enumerable.cr:1289 (068.cr)
[1, 2, 3, 4, 5, 6].product # => 720

# enumerable.cr:1295 (069.cr)
([] of Int32).product # => 1

# enumerable.cr:1310 (070.cr)
[1, 2, 3, 4, 5, 6].product(7) # => 5040

# enumerable.cr:1316 (071.cr)
([] of Int32).product(7) # => 7

# enumerable.cr:1325 (072.cr)
["Alice", "Bob"].product { |name| name.size } # => 15 (5 * 3)

# enumerable.cr:1331 (073.cr)
([] of Int32).product { |x| x + 1 } # => 1

# enumerable.cr:1343 (074.cr)
["Alice", "Bob"].product(2) { |name| name.size } # => 30 (2 * 5 * 3)

# enumerable.cr:1349 (075.cr)
([] of String).product(1) { |name| name.size } # => 1

# enumerable.cr:1375 (076.cr)
[1, 2, 3, 4, 5, 0].take_while { |i| i < 3 } # => [1, 2]

# enumerable.cr:1389 (077.cr)
(1..5).to_a # => [1, 2, 3, 4, 5]

# enumerable.cr:1401 (078.cr)
[[:a, :b], [:c, :d]].to_h        # => {:a => :b, :c => :d}
Tuple.new({:a, 1}, {:c, 2}).to_h # => {:a => 1, :c => 2}

# enumerable.cr:1413 (079.cr)
(1..3).to_h { |i| {i, i ** 2} } # => {1 => 1, 2 => 4, 3 => 9}
