require "spec"

puts "# iterator.cr:9 (001.cr)" # :nocode: :example:
( (1..10_000_000).select(&.even?).map { |x| x * 3 }.first(3) ).should eq( [6, 12, 18] )

puts "# iterator.cr:18 (002.cr)" # :nocode: :example:
(1..10_000_000).each.select(&.even?).map { |x| x * 3 }.first(3) # => #< Iterator(T)::First...

puts "# iterator.cr:28 (003.cr)" # :nocode: :example:
( (1..10_000_000).each.select(&.even?).map { |x| x * 3 }.first(3).to_a ).should eq( [6, 12, 18] )

puts "# iterator.cr:41 (004.cr)" # :nocode: :example:
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
( zeros.to_a ).should eq( [0, 0, 0, 0, 0] )

zeros.rewind
( zeros.first(3).to_a ).should eq( [0, 0, 0] )

puts "# iterator.cr:167 (005.cr)" # :nocode: :example:
iter = (1..2).each.chain(('a'..'b').each)
( iter.next ).should eq( 1 )
( iter.next ).should eq( 2 )
( iter.next ).should eq( 'a' )
( iter.next ).should eq( 'b' )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:209 (006.cr)" # :nocode: :example:
array_of_iters = [[1], [2, 3], [4, 5, 6]]
iter = Iterator(Int32).chain array_of_iters
( iter.next ).should eq( 1 )
( iter.next ).should eq( 2 )
( iter.next ).should eq( 3 )
( iter.next ).should eq( 4 )

puts "# iterator.cr:259 (007.cr)" # :nocode: :example:
iter = [1, nil, 2, nil].each.compact_map { |e| e.try &.*(2) }
( iter.next ).should eq( 2 )
( iter.next ).should eq( 4 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:288 (008.cr)" # :nocode: :example:
iter = (1..5).each.cons(3)
( iter.next ).should eq( [1, 2, 3] )
( iter.next ).should eq( [2, 3, 4] )
( iter.next ).should eq( [3, 4, 5] )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:350 (009.cr)" # :nocode: :example:
iter = ["a", "b", "c"].each.cycle
( iter.next ).to_s.should eq( "a" )
( iter.next ).to_s.should eq( "b" )
( iter.next ).to_s.should eq( "c" )
( iter.next ).to_s.should eq( "a" )
( iter.next ).to_s.should eq( "b" )
( iter.next ).to_s.should eq( "c" )
( iter.next ).to_s.should eq( "a" )
# and so an and so on

puts "# iterator.cr:387 (010.cr)" # :nocode: :example:
iter = ["a", "b", "c"].each.cycle(2)
( iter.next ).to_s.should eq( "a" )
( iter.next ).to_s.should eq( "b" )
( iter.next ).to_s.should eq( "c" )
( iter.next ).to_s.should eq( "a" )
( iter.next ).to_s.should eq( "b" )
( iter.next ).to_s.should eq( "c" )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:436 (011.cr)" # :nocode: :example:
iter = ["a", "b", "c"].each
iter.each { |x| print x, " " } # Prints "a b c"

puts "# iterator.cr:451 (012.cr)" # :nocode: :example:
iter = (1..9).each.each_slice(3)
( iter.next ).should eq( [1, 2, 3] )
( iter.next ).should eq( [4, 5, 6] )
( iter.next ).should eq( [7, 8, 9] )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:474 (013.cr)" # :nocode: :example:
iter = [(1..2).each, ('a'..'b').each].each.flatten
( iter.next ).should eq( 1 )
( iter.next ).should eq( 2 )
( iter.next ).should eq( 'a' )
( iter.next ).should eq( 'b' )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:556 (014.cr)" # :nocode: :example:
iter = [1, 2, 3].each.flat_map { |x| [x, x] }

( iter.next ).should eq( 1 )
( iter.next ).should eq( 1 )
( iter.next ).should eq( 2 )

iter = [1, 2, 3].each.flat_map { |x| [x, x].each }

( iter.to_a ).should eq( [1, 1, 2, 2, 3, 3] )

puts "# iterator.cr:636 (015.cr)" # :nocode: :example:
iter = (1..3).each.in_groups_of(2)
( iter.next ).should eq( [1, 2] )
( iter.next ).should eq( [3, nil] )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:642 (016.cr)" # :nocode: :example:
iter = (1..3).each.in_groups_of(2, 'z')
( iter.next ).should eq( [1, 2] )
( iter.next ).should eq( [3, 'z'] )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:702 (017.cr)" # :nocode: :example:
iter = [1, 2, 3].each.map &.*(2)
( iter.next ).should eq( 2 )
( iter.next ).should eq( 4 )
( iter.next ).should eq( 6 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:729 (018.cr)" # :nocode: :example:
iter = [1, 2, 3].each.reject &.odd?
( iter.next ).should eq( 2 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:741 (019.cr)" # :nocode: :example:
iter = [1, false, 3, true].each.reject(Bool)
( iter.next ).should eq( 1 )
( iter.next ).should eq( 3 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:757 (020.cr)" # :nocode: :example:
iter = [2, 3, 1, 5, 4, 6].reject(3..5)
( iter.next ).should eq( 2 )
( iter.next ).should eq( 1 )
( iter.next ).should eq( 6 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:788 (021.cr)" # :nocode: :example:
iter = [1, 2, 3].each.select &.odd?
( iter.next ).should eq( 1 )
( iter.next ).should eq( 3 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:801 (022.cr)" # :nocode: :example:
iter = [1, false, 3, nil].each.select(Int32)
( iter.next ).should eq( 1 )
( iter.next ).should eq( 3 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:814 (023.cr)" # :nocode: :example:
iter = [1, 3, 2, 5, 4, 6].select(3..5)
( iter.next ).should eq( 3 )
( iter.next ).should eq( 5 )
( iter.next ).should eq( 4 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:862 (024.cr)" # :nocode: :example:
iter = (1..3).each.skip(2)
iter.next # -> 3
iter.next # -> Iterator::Stop::INSTANCE

puts "# iterator.cr:897 (025.cr)" # :nocode: :example:
iter = [1, 2, 3, 4, 0].each.skip_while { |i| i < 3 }
( iter.next ).should eq( 3 )
( iter.next ).should eq( 4 )
( iter.next ).should eq( 0 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:983 (026.cr)" # :nocode: :example:
iter = (1..6).each.step(2)
( iter.next ).should eq( 1 )
( iter.next ).should eq( 3 )
( iter.next ).should eq( 5 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1017 (027.cr)" # :nocode: :example:
iter = ["a", "b", "c"].each.first 2
( iter.next ).to_s.should eq( "a" )
( iter.next ).to_s.should eq( "b" )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1054 (028.cr)" # :nocode: :example:
iter = (1..5).each.take_while { |i| i < 3 }
( iter.next ).should eq( 1 )
( iter.next ).should eq( 2 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1092 (029.cr)" # :nocode: :example:
a = 0
iter = (1..3).each.tap { |x| a += x }
( iter.next ).should eq( 1 )
( a ).should eq( 1 )
( iter.next ).should eq( 2 )
( a ).should eq( 3 )
( iter.next ).should eq( 3 )
( a ).should eq( 6 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1124 (030.cr)" # :nocode: :example:
iter = [1, 2, 1].each.uniq
( iter.next ).should eq( 1 )
( iter.next ).should eq( 2 )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1138 (031.cr)" # :nocode: :example:
iter = [["a", "a"], ["b", "a"], ["a", "c"]].each.uniq &.first
( iter.next ).should eq( ["a", "a"] )
( iter.next ).should eq( ["b", "a"] )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1176 (032.cr)" # :nocode: :example:
iter = (1..3).each.with_index
( iter.next ).should eq( {1, 0} )
( iter.next ).should eq( {2, 1} )
( iter.next ).should eq( {3, 2} )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1218 (033.cr)" # :nocode: :example:
iter = (1..3).each.with_object("a")
( iter.next ).should eq( {1, "a"} )
( iter.next ).should eq( {2, "a"} )
( iter.next ).should eq( {3, "a"} )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1245 (034.cr)" # :nocode: :example:
iter1 = [4, 5, 6].each
iter2 = [7, 8, 9].each
iter = iter1.zip(iter2)
( iter.next ).should eq( {4, 7} )
( iter.next ).should eq( {5, 8} )
( iter.next ).should eq( {6, 9} )
( iter.next ).should eq( Iterator::Stop::INSTANCE )

puts "# iterator.cr:1288 (035.cr)" # :nocode: :example:
[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunk(&.even?).each do |even, ary|
  p [even, ary]
end

# => [false, [3, 1]]
#    [true, [4]]
#    [false, [1, 5, 9]]
#    [true, [2, 6]]
#    [false, [5, 3, 5]]

puts "# iterator.cr:1373 (036.cr)" # :nocode: :example:
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#                   ^         ^    ^
iter = ary.slice_after(&.uppercase?)
( iter.next ).should eq( ['a', 'b', 'C'] )
( iter.next ).should eq( ['d', 'E'] )
( iter.next ).should eq( ['F'] )
( iter.next ).should eq( ['g', 'h'] )
( iter.next ).should eq( Iterator::Stop )

puts "# iterator.cr:1401 (037.cr)" # :nocode: :example:
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#                   ^         ^    ^
iter = ary.slice_after('A'..'Z')
( iter.next ).should eq( ['a', 'b', 'C'] )
( iter.next ).should eq( ['d', 'E'] )
( iter.next ).should eq( ['F'] )
( iter.next ).should eq( ['g', 'h'] )
( iter.next ).should eq( Iterator::Stop )

puts "# iterator.cr:1487 (038.cr)" # :nocode: :example:
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#              ^         ^    ^
iter = ary.slice_before(&.uppercase?)
( iter.next ).should eq( ['a', 'b'] )
( iter.next ).should eq( ['C', 'd'] )
( iter.next ).should eq( ['E'] )
( iter.next ).should eq( ['F', 'g', 'h'] )
( iter.next ).should eq( Iterator::Stop )

puts "# iterator.cr:1515 (039.cr)" # :nocode: :example:
ary = ['a', 'b', 'C', 'd', 'E', 'F', 'g', 'h']
#              ^         ^    ^
iter = ary.slice_before('A'..'Z')
( iter.next ).should eq( ['a', 'b'] )
( iter.next ).should eq( ['C', 'd'] )
( iter.next ).should eq( ['E'] )
( iter.next ).should eq( ['F', 'g', 'h'] )
( iter.next ).should eq( Iterator::Stop )

puts "# iterator.cr:1608 (040.cr)" # :nocode: :example:
ary = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21]
iter = ary.slice_when { |i, j| i + 1 != j }
( iter.next ).should eq( [1, 2] )
( iter.next ).should eq( [4] )
( iter.next ).should eq( [9, 10, 11, 12] )
( iter.next ).should eq( [15, 16] )
( iter.next ).should eq( [19, 20, 21] )
( iter.next ).should eq( Iterator::Stop )

puts "# iterator.cr:1638 (041.cr)" # :nocode: :example:
ary = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21]
iter = ary.chunk_while { |i, j| i + 1 == j }
( iter.next ).should eq( [1, 2] )
( iter.next ).should eq( [4] )
( iter.next ).should eq( [9, 10, 11, 12] )
( iter.next ).should eq( [15, 16] )
( iter.next ).should eq( [19, 20, 21] )
( iter.next ).should eq( Iterator::Stop )

