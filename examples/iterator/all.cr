# iterator.cr: 41 examples

# iterator.cr:9 (001.cr)
(1..10_000_000).select(&.even?).map { |x| x * 3 }.first(3) # => [6, 12, 18]

# iterator.cr:18 (002.cr)
(1..10_000_000).each.select(&.even?).map { |x| x * 3 }.first(3) # => #< Iterator(T)::First...

# iterator.cr:28 (003.cr)
(1..10_000_000).each.select(&.even?).map { |x| x * 3 }.first(3).to_a # => [6, 12, 18]

# iterator.cr:41 (004.cr)
class Zeros
  include Iterator(Int32)

  def initialize(@size : Int32)
    @produced = 0
  end

  def next
    if @produced < @size
      @produced += 1
      0
    else
      stop
    end
  end

  def rewind
    @produced = 0
    self
  end
end

zeros = Zeros.new(5)
zeros.to_a # => [0, 0, 0, 0, 0]

zeros.rewind
zeros.first(3).to_a # => [0, 0, 0]

# iterator.cr:167 (005.cr)
iter = (1..2).each.chain(('a'..'b').each)
iter.next # => 1
iter.next # => 2
iter.next # => 'a'
iter.next # => 'b'
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:209 (006.cr)
array_of_iters = [[1], [2, 3], [4, 5, 6]]
iter = Iterator(Int32).chain array_of_iters
iter.next # => 1
iter.next # => 2
iter.next # => 3
iter.next # => 4

# iterator.cr:259 (007.cr)
iter = [1, nil, 2, nil].each.compact_map { |e| e.try &.*(2) }
iter.next # => 2
iter.next # => 4
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:288 (008.cr)
iter = (1..5).each.cons(3)
iter.next # => [1, 2, 3]
iter.next # => [2, 3, 4]
iter.next # => [3, 4, 5]
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:350 (009.cr)
iter = ["a", "b", "c"].each.cycle
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => "a"
# and so an and so on

# iterator.cr:387 (010.cr)
iter = ["a", "b", "c"].each.cycle(2)
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => "a"
iter.next # => "b"
iter.next # => "c"
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:436 (011.cr)
iter = ["a", "b", "c"].each
iter.each { |x| print x, " " } # Prints "a b c"

# iterator.cr:451 (012.cr)
iter = (1..9).each.each_slice(3)
iter.next # => [1, 2, 3]
iter.next # => [4, 5, 6]
iter.next # => [7, 8, 9]
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:474 (013.cr)
iter = [(1..2).each, ('a'..'b').each].each.flatten
iter.next # => 1
iter.next # => 2
iter.next # => 'a'
iter.next # => 'b'
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:556 (014.cr)
iter = [1, 2, 3].each.flat_map { |x| [x, x] }

iter.next # => 1
iter.next # => 1
iter.next # => 2

iter = [1, 2, 3].each.flat_map { |x| [x, x].each }

iter.to_a # => [1, 1, 2, 2, 3, 3]

# iterator.cr:636 (015.cr)
iter = (1..3).each.in_groups_of(2)
iter.next # => [1, 2]
iter.next # => [3, nil]
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:642 (016.cr)
iter = (1..3).each.in_groups_of(2, 'z')
iter.next # => [1, 2]
iter.next # => [3, 'z']
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:702 (017.cr)
iter = [1, 2, 3].each.map &.*(2)
iter.next # => 2
iter.next # => 4
iter.next # => 6
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:729 (018.cr)
iter = [1, 2, 3].each.reject &.odd?
iter.next # => 2
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:741 (019.cr)
iter = [1, false, 3, true].each.reject(Bool)
iter.next # => 1
iter.next # => 3
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:757 (020.cr)
iter = [2, 3, 1, 5, 4, 6].reject(3..5)
iter.next # => 2
iter.next # => 1
iter.next # => 6
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:788 (021.cr)
iter = [1, 2, 3].each.select &.odd?
iter.next # => 1
iter.next # => 3
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:801 (022.cr)
iter = [1, false, 3, nil].each.select(Int32)
iter.next # => 1
iter.next # => 3
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:814 (023.cr)
iter = [1, 3, 2, 5, 4, 6].select(3..5)
iter.next # => 3
iter.next # => 5
iter.next # => 4
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:862 (024.cr)
iter = (1..3).each.skip(2)
iter.next # -> 3
iter.next # -> Iterator::Stop::INSTANCE

# iterator.cr:897 (025.cr)
iter = [1, 2, 3, 4, 0].each.skip_while { |i| i < 3 }
iter.next # => 3
iter.next # => 4
iter.next # => 0
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:983 (026.cr)
iter = (1..6).each.step(2)
iter.next # => 1
iter.next # => 3
iter.next # => 5
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1017 (027.cr)
iter = ["a", "b", "c"].each.first 2
iter.next # => "a"
iter.next # => "b"
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1054 (028.cr)
iter = (1..5).each.take_while { |i| i < 3 }
iter.next # => 1
iter.next # => 2
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1092 (029.cr)
a = 0
iter = (1..3).each.tap { |x| a += x }
iter.next # => 1
a         # => 1
iter.next # => 2
a         # => 3
iter.next # => 3
a         # => 6
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1124 (030.cr)
iter = [1, 2, 1].each.uniq
iter.next # => 1
iter.next # => 2
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1138 (031.cr)
iter = [["a", "a"], ["b", "a"], ["a", "c"]].each.uniq &.first
iter.next # => ["a", "a"]
iter.next # => ["b", "a"]
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1176 (032.cr)
iter = (1..3).each.with_index
iter.next # => {1, 0}
iter.next # => {2, 1}
iter.next # => {3, 2}
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1218 (033.cr)
iter = (1..3).each.with_object("a")
iter.next # => {1, "a"}
iter.next # => {2, "a"}
iter.next # => {3, "a"}
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1245 (034.cr)
iter1 = [4, 5, 6].each
iter2 = [7, 8, 9].each
iter = iter1.zip(iter2)
iter.next # => {4, 7}
iter.next # => {5, 8}
iter.next # => {6, 9}
iter.next # => Iterator::Stop::INSTANCE

# iterator.cr:1288 (035.cr)
[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunk(&.even?).each do |even, ary|
  p [even, ary]
end

# => [false, [3, 1]]
#    [true, [4]]
#    [false, [1, 5, 9]]
#    [true, [2, 6]]
#    [false, [5, 3, 5]]

# iterator.cr:1373 (036.cr)
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#                   ^         ^    ^
iter = ary.slice_after(&.uppercase?)
iter.next # => ['a', 'b', 'C']
iter.next # => ['d', 'E']
iter.next # => ['F']
iter.next # => ['g', 'h']
iter.next # => Iterator::Stop

# iterator.cr:1401 (037.cr)
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#                   ^         ^    ^
iter = ary.slice_after('A'..'Z')
iter.next # => ['a', 'b', 'C']
iter.next # => ['d', 'E']
iter.next # => ['F']
iter.next # => ['g', 'h']
iter.next # => Iterator::Stop

# iterator.cr:1487 (038.cr)
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#              ^         ^    ^
iter = ary.slice_before(&.uppercase?)
iter.next # => ['a', 'b']
iter.next # => ['C', 'd']
iter.next # => ['E']
iter.next # => ['F', 'g', 'h']
iter.next # => Iterator::Stop

# iterator.cr:1515 (039.cr)
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#              ^         ^    ^
iter = ary.slice_before('A'..'Z')
iter.next # => ['a', 'b']
iter.next # => ['C', 'd']
iter.next # => ['E']
iter.next # => ['F', 'g', 'h']
iter.next # => Iterator::Stop

# iterator.cr:1608 (040.cr)
ary = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21]
iter = ary.slice_when { |i, j| i + 1 != j }
iter.next # => [1, 2]
iter.next # => [4]
iter.next # => [9, 10, 11, 12]
iter.next # => [15, 16]
iter.next # => [19, 20, 21]
iter.next # => Iterator::Stop

# iterator.cr:1638 (041.cr)
ary = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21]
iter = ary.chunk_while { |i, j| i + 1 == j }
iter.next # => [1, 2]
iter.next # => [4]
iter.next # => [9, 10, 11, 12]
iter.next # => [15, 16]
iter.next # => [19, 20, 21]
iter.next # => Iterator::Stop
