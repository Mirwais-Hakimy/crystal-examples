# array.cr: 79 examples

# array.cr:9 (001.cr)
Array(Int32).new  # => []
[1, 2, 3]         # Array(Int32)
[1, "hello", 'x'] # Array(Int32 | String | Char)

# array.cr:21 (002.cr)
[] of Int32 # same as Array(Int32)
# []          # syntax error

# array.cr:33 (003.cr)
set = Set{1, 2, 3} # => Set{1, 2, 3}
set.class          # => Set(Int32)

# array.cr:40 (004.cr)
set = Set(typeof(1, 2, 3)).new
set << 1
set << 2
set << 3

# array.cr:52 (005.cr)
[:foo, :bar].size # => 2

# array.cr:73 (006.cr)
ary = Array(Int32).new(5)
ary.size # => 0

# array.cr:93 (007.cr)
Array.new(3, 'a') # => ['a', 'a', 'a']

ary = Array.new(3, [1])
ary # => [[1], [1], [1]]
ary[0][0] = 2
ary # => [[2], [2], [2]]

# array.cr:119 (008.cr)
Array.new(3) { |i| (i + 1) ** 2 } # => [1, 4, 9]

ary = Array.new(3) { [1] }
ary # => [[1], [1], [1]]
ary[0][0] = 2
ary # => [[2], [1], [1]]

# array.cr:142 (009.cr)
# pending by 'file:pendings/array/009.cr'
# Array.build(3) do |buffer|
#   LibSome.fill_buffer_and_return_number_of_elements_filled(buffer)
# end

# array.cr:156 (010.cr)
ary = [1, 2, 3]
ary == [1, 2, 3] # => true
ary == [2, 3]    # => false

# array.cr:179 (011.cr)
[8] <=> [1, 2, 3] # => 1
[2] <=> [4, 2, 3] # => -1
[1, 2] <=> [1, 2] # => 0

# array.cr:196 (012.cr)
[1, 1, 3, 5] & [1, 2, 3]               # => [ 1, 3 ]
['a', 'b', 'b', 'z'] & ['a', 'b', 'c'] # => [ 'a', 'b' ]

# array.cr:225 (013.cr)
["a", "b", "c"] | ["c", "d", "a"] # => [ "a", "b", "c", "d" ]

# array.cr:255 (014.cr)
[1, 2] + ["a"]  # => [1,2,"a"] of (Int32 | String)
[1, 2] + [2, 3] # => [1,2,2,3]

# array.cr:271 (015.cr)
[1, 2, 3] - [2, 1] # => [3]

# array.cr:285 (016.cr)
["a", "b", "c"] * 2 # => [ "a", "b", "c", "a", "b", "c" ]

# array.cr:298 (017.cr)
a = [1, 2]
a << 3 # => [1,2,3]

# array.cr:311 (018.cr)
ary = [1, 2, 3]
ary[0] = 5
p ary # => [5,2,3]

# ary[3] = 5 # raises IndexError

# array.cr:332 (019.cr)
a = [1, 2, 3, 4, 5]
a[1, 3] = 6
a # => [1, 6, 5]

a = [1, 2, 3, 4, 5]
a[1, 0] = 6
a # => [1, 6, 2, 3, 4, 5]

# array.cr:365 (020.cr)
a = [1, 2, 3, 4, 5]
a[1..3] = 6
a # => [1, 6, 5]

a = [1, 2, 3, 4, 5]
a[1...1] = 6
a # => [1, 6, 2, 3, 4, 5]

# array.cr:380 (021.cr)
a = [1, 2, 3, 4, 5]
a[1, 3] = [6, 7, 8]
a # => [1, 6, 7, 8, 5]

a = [1, 2, 3, 4, 5]
a[1, 3] = [6, 7]
a # => [1, 6, 7, 5]

a = [1, 2, 3, 4, 5]
a[1, 3] = [6, 7, 8, 9, 10]
a # => [1, 6, 7, 8, 9, 10, 5]

# array.cr:423 (022.cr)
a = [1, 2, 3, 4, 5]
a[1..3] = [6, 7, 8]
a # => [1, 6, 7, 8, 5]

a = [1, 2, 3, 4, 5]
a[1..3] = [6, 7]
a # => [1, 6, 7, 5]

a = [1, 2, 3, 4, 5]
a[1..3] = [6, 7, 8, 9, 10]
a # => [1, 6, 7, 8, 9, 10, 5]

# array.cr:448 (023.cr)
a = ["a", "b", "c", "d", "e"]
a[1..3]    # => ["b", "c", "d"]
a[4..7]    # => ["e"]
# a[6..10]   # raise IndexError
a[5..10]   # => []
a[-2...-1] # => ["d"]

# array.cr:469 (024.cr)
a = ["a", "b", "c", "d", "e"]
a[-3, 3] # => ["c", "d", "e"]
# a[6, 1]  # raise IndexError
a[1, 2]  # => ["b", "c"]
a[5, 1]  # => []

# array.cr:505 (025.cr)
a = ["a", "b", "c", "d", "e"]
a.clear # => []

# array.cr:520 (026.cr)
ary = [[1, 2], [3, 4]]
ary2 = ary.clone
ary[0][0] = 5
ary  # => [[5, 2], [3, 4]]
ary2 # => [[1, 2], [3, 4]]

ary2 << [7, 8]
ary  # => [[5, 2], [3, 4]]
ary2 # => [[1, 2], [3, 4], [7, 8]]

# array.cr:537 (027.cr)
["a", nil, "b", nil, "c", nil].compact # => ["a", "b", "c"]

# array.cr:546 (028.cr)
ary = ["a", nil, "b", nil, "c"]
ary.compact!
ary # => ["a", "b", "c"]

# array.cr:557 (029.cr)
ary = ["a", "b"]
ary.concat(["c", "d"])
ary # => ["a", "b", "c", "d"]

# array.cr:602 (030.cr)
a = ["a", "b", "b", "b", "c"]
a.delete("b") # => "b"
a             # => ["a", "c"]

a.delete("x") # => nil
a             # => ["a", "c"]

# array.cr:617 (031.cr)
a = ["ant", "bat", "cat", "dog"]
a.delete_at(2)  # => "cat"
a               # => ["ant", "bat", "dog"]
# a.delete_at(99) # raises IndexError

# array.cr:637 (032.cr)
a = ["ant", "bat", "cat", "dog"]
a.delete_at(1..2)    # => ["bat", "cat"]
a                    # => ["ant", "dog"]
# a.delete_at(99..100) # raises IndexError

# array.cr:653 (033.cr)
a = ["ant", "bat", "cat", "dog"]
a.delete_at(1, 2)  # => ["bat", "cat"]
a                  # => ["ant", "dog"]
# a.delete_at(99, 1) # raises IndexError

# array.cr:673 (034.cr)
ary = [[1, 2], [3, 4]]
ary2 = ary.dup
ary[0][0] = 5
ary  # => [[5, 2], [3, 4]]
ary2 # => [[5, 2], [3, 4]]

ary2 << [7, 8]
ary  # => [[5, 2], [3, 4]]
ary2 # => [[5, 2], [3, 4], [7, 8]]

# array.cr:694 (035.cr)
a = [1, 2, 3, 4]
a.fill { |i| i * i } # => [0, 1, 4, 9]

# array.cr:711 (036.cr)
a = [1, 2, 3, 4]
a.fill(2) { |i| i * i } # => [1, 2, 4, 9]

# array.cr:734 (037.cr)
a = [1, 2, 3, 4, 5, 6]
a.fill(2, 2) { |i| i * i } # => [1, 2, 4, 9, 5, 6]

# array.cr:753 (038.cr)
a = [1, 2, 3, 4, 5, 6]
a.fill(2..3) { |i| i * i } # => [1, 2, 4, 9, 5, 6]

# array.cr:765 (039.cr)
a = [1, 2, 3]
a.fill(9) # => [9, 9, 9]

# array.cr:777 (040.cr)
a = [1, 2, 3, 4, 5]
a.fill(9, 2) # => [1, 2, 9, 9, 9]

# array.cr:790 (041.cr)
a = [1, 2, 3, 4, 5]
a.fill(9, 2, 2) # => [1, 2, 9, 9, 5]

# array.cr:802 (042.cr)
a = [1, 2, 3, 4, 5]
a.fill(9, 2..3) # => [1, 2, 9, 9, 5]

# array.cr:812 (043.cr)
[1, 2, 3].first(2) # => [1, 2]
[1, 2, 3].first(4) # => [1, 2, 3]

# array.cr:825 (044.cr)
a = ["a", "b", "c"]
a.insert(0, "x")  # => ["x", "a", "b", "c"]
a.insert(2, "y")  # => ["x", "a", "y", "b", "c"]
a.insert(-1, "z") # => ["x", "a", "y", "b", "c", "z"]

# array.cr:855 (045.cr)
[1, 2, 3].last(2) # => [2, 3]
[1, 2, 3].last(4) # => [1, 2, 3]

# array.cr:880 (046.cr)
a = [1, 2, 3]
a.map! { |x| x * x }
a # => [1, 4, 9]

# array.cr:893 (047.cr)
ary = [1, 6, 2, 4, 8]
ary.select! { |x| x > 3 }
ary # => [6, 4, 8]

# array.cr:907 (048.cr)
ary = [1, 6, 2, 4, 8]
ary.select!(3..7)
ary # => [6, 4]

# array.cr:921 (049.cr)
ary = [1, 6, 2, 4, 8]
ary.reject! { |x| x > 3 }
ary # => [1, 2]

# array.cr:936 (050.cr)
ary = [1, 6, 2, 4, 8]
ary.reject!(3..7)
ary # => [1, 2, 8]

# array.cr:995 (051.cr)
[1, 2, 3, 4, 5, 6].skip(3) # => [4, 5, 6]

# array.cr:1010 (052.cr)
a = [1, 2, 3]
a.permutations    # => [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutations(1) # => [[1],[2],[3]]
a.permutations(2) # => [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutations(3) # => [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutations(0) # => [[]]
a.permutations(4) # => []

# array.cr:1029 (053.cr)
a = [1, 2, 3]
sums = [] of Int32
a.each_permutation(2) { |p| sums << p.sum } # => nil
sums                                        # => [3, 4, 3, 5, 4, 5]

# array.cr:1078 (054.cr)
iter = [1, 2, 3].each_permutation
iter.next # => [1, 2, 3]
iter.next # => [1, 3, 2]
iter.next # => [2, 1, 3]
iter.next # => [2, 3, 1]
iter.next # => [3, 1, 2]
iter.next # => [3, 2, 1]
iter.next # => #<Iterator::Stop>

# array.cr:1178 (055.cr)
s = [1, 2, 3]          # => [1, 2, 3]
t = [4, 5, 6, [7, 8]]  # => [4, 5, 6, [7, 8]]
u = [9, [10, 11].each] # => [9, #<Indexable::ItemIterator>]
a = [s, t, u, 12, 13]  # => [[1, 2, 3], [4, 5, 6, [7, 8]], 9, #<Indexable::ItemIterator>, 12, 13]
a.flatten              # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

# array.cr:1314 (056.cr)
a = ["a", "b", "c"]
a.pop # => "c"
a     # => ["a", "b"]

# array.cr:1326 (057.cr)
a = [1]
a.pop { "Testing" } # => 1
a.pop { "Testing" } # => "Testing"

# array.cr:1348 (058.cr)
a = ["a", "b", "c"]
a.pop(2) # => ["b", "c"]
a        # => ["a"]

a = ["a", "b", "c"]
a.pop(4) # => ["a", "b", "c"]
a        # => []

# array.cr:1393 (059.cr)
a = ["a", "b"]
a.push("c") # => ["a", "b", "c"]
# a.push(1)   # Errors, because the array only accepts String.

a = ["a", "b"] of (Int32 | String)
a.push("c") # => ["a", "b", "c"]
a.push(1)   # => ["a", "b", "c", 1]

# array.cr:1412 (060.cr)
a = ["a"]
a.push("b", "c") # => ["a", "b", "c"]

# array.cr:1435 (061.cr)
a = [1, 2, 3]
a.reverse # => [3, 2, 1]

# array.cr:1479 (062.cr)
a = [1, 2, 3]
a.sample(2)                # => [2, 1]
a.sample(2, Random.new(1)) # => [1, 3]

# array.cr:1517 (063.cr)
a = ["a", "b", "c"]
a.shift # => "a"
a       # => ["b", "c"]

# array.cr:1544 (064.cr)
a = ["a", "b", "c"]
a.shift # => "a"
a       # => ["b", "c"]

a = ["a", "b", "c"]
a.shift(4) # => ["a", "b", "c"]
a          # => []

# array.cr:1571 (065.cr)
a = ["a", "b"]
a.shift? # => "a"
a        # => ["b"]
a.shift? # => "b"
a        # => []
a.shift? # => nil
a        # => []

# array.cr:1600 (066.cr)
a = [3, 1, 2]
a.sort # => [1, 2, 3]
a      # => [3, 1, 2]

# array.cr:1616 (067.cr)
a = [3, 1, 2]
b = a.sort { |a, b| b <=> a }

b # => [3, 2, 1]
a # => [3, 1, 2]

# array.cr:1630 (068.cr)
a = [3, 1, 2]
a.sort!
a # => [1, 2, 3]

# array.cr:1648 (069.cr)
a = [3, 1, 2]
a.sort! { |a, b| b <=> a }
a # => [3, 2, 1]

# array.cr:1662 (070.cr)
a = %w(apple pear fig)
b = a.sort_by { |word| word.size }
b # => ["fig", "pear", "apple"]
a # => ["apple", "pear", "fig"]

# array.cr:1676 (071.cr)
a = %w(apple pear fig)
a.sort_by! { |word| word.size }
a # => ["fig", "pear", "apple"]

# array.cr:1692 (072.cr)
a = ["first", "second", "third"]
a.swap(1, 2)  # => ["first", "third", "second"]
a             # => ["first", "third", "second"]
a.swap(0, -1) # => ["second", "third", "first"]
a             # => ["second", "third", "first"]
# a.swap(2, 3)  # => raises "Index out of bounds (IndexError)"

# array.cr:1738 (073.cr)
ary = [1, 2, 3]
ary.to_unsafe[0] # => 1

# array.cr:1748 (074.cr)
a = [[:a, :b], [:c, :d], [:e, :f]]
a.transpose # => [[:a, :c, :e], [:b, :d, :f]]
a           # => [[:a, :b], [:c, :d], [:e, :f]]

# array.cr:1771 (075.cr)
a = ["a", "a", "b", "b", "c"]
a.uniq # => ["a", "b", "c"]
a      # => [ "a", "a", "b", "b", "c" ]

# array.cr:1783 (076.cr)
a = [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}]
a.uniq { |s| s[0] } # => [{"student", "sam"}, {"teacher", "matz"}]
a                   # => [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}]

# array.cr:1799 (077.cr)
a = ["a", "a", "b", "b", "c"]
a.uniq! # => ["a", "b", "c"]
a       # => ["a", "b", "c"]

# array.cr:1810 (078.cr)
a = [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}]
a.uniq! { |s| s[0] } # => [{"student", "sam"}, {"teacher", "matz"}]
a                    # => [{"student", "sam"}, {"teacher", "matz"}]

# array.cr:1846 (079.cr)
a = ["a", "b"]
a.unshift("c") # => ["c", "a", "b"]
# a.unshift(1)   # Errors, because the array only accepts String.

a = ["a", "b"] of (Int32 | String)
a.unshift("c") # => ["c", "a", "b"]
a.unshift(1)   # => [1, "c", "a", "b"]
