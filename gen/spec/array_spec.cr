require "spec"

it "array.cr" do
puts # :nocode:

puts "# array.cr:9 (001.cr)" # :nocode: :example:
( Array(Int32).new ).to_s.should eq( "[]" )
[1, 2, 3]         # Array(Int32)
[1, "hello", 'x'] # Array(Int32 | String | Char)

puts "# array.cr:21 (002.cr)" # :nocode: :example:
[] of Int32 # same as Array(Int32)
# []          # syntax error

puts "# array.cr:33 (003.cr)" # :nocode: :example:
( set = Set{1, 2, 3} ).should eq( Set{1, 2, 3} )
( set.class ).should eq( Set(Int32) )

puts "# array.cr:40 (004.cr)" # :nocode: :example:
set = Set(typeof(1, 2, 3)).new
set << 1
set << 2
set << 3

puts "# array.cr:52 (005.cr)" # :nocode: :example:
( [:foo, :bar].size ).should eq( 2 )

puts "# array.cr:73 (006.cr)" # :nocode: :example:
ary = Array(Int32).new(5)
( ary.size ).should eq( 0 )

puts "# array.cr:93 (007.cr)" # :nocode: :example:
( Array.new(3, 'a') ).should eq( ['a', 'a', 'a'] )

ary = Array.new(3, [1])
( ary ).should eq( [[1], [1], [1]] )
ary[0][0] = 2
( ary ).should eq( [[2], [2], [2]] )

puts "# array.cr:119 (008.cr)" # :nocode: :example:
( Array.new(3) { |i| (i + 1) ** 2 } ).should eq( [1, 4, 9] )

ary = Array.new(3) { [1] }
( ary ).should eq( [[1], [1], [1]] )
ary[0][0] = 2
( ary ).should eq( [[2], [1], [1]] )

puts "# array.cr:142 (009.cr)" # :nocode: :example:
# pending by 'file:pendings/array/009.cr' # :pending:
# Array.build(3) do |buffer|
#   LibSome.fill_buffer_and_return_number_of_elements_filled(buffer)
# end

puts "# array.cr:156 (010.cr)" # :nocode: :example:
ary = [1, 2, 3]
( ary == [1, 2, 3] ).should eq( true )
( ary == [2, 3] ).should eq( false )

puts "# array.cr:179 (011.cr)" # :nocode: :example:
( [8] <=> [1, 2, 3] ).should eq( 1 )
( [2] <=> [4, 2, 3] ).should eq( -1 )
( [1, 2] <=> [1, 2] ).should eq( 0 )

puts "# array.cr:196 (012.cr)" # :nocode: :example:
( [1, 1, 3, 5] & [1, 2, 3] ).should eq( [ 1, 3 ] )
( ['a', 'b', 'b', 'z'] & ['a', 'b', 'c'] ).should eq( [ 'a', 'b' ] )

puts "# array.cr:225 (013.cr)" # :nocode: :example:
( ["a", "b", "c"] | ["c", "d", "a"] ).should eq( [ "a", "b", "c", "d" ] )

puts "# array.cr:255 (014.cr)" # :nocode: :example:
( [1, 2] + ["a"] ).should eq( [1,2,"a"] of (Int32 | String) )
( [1, 2] + [2, 3] ).should eq( [1,2,2,3] )

puts "# array.cr:271 (015.cr)" # :nocode: :example:
( [1, 2, 3] - [2, 1] ).should eq( [3] )

puts "# array.cr:285 (016.cr)" # :nocode: :example:
( ["a", "b", "c"] * 2 ).should eq( [ "a", "b", "c", "a", "b", "c" ] )

puts "# array.cr:298 (017.cr)" # :nocode: :example:
a = [1, 2]
( a << 3 ).should eq( [1,2,3] )

puts "# array.cr:311 (018.cr)" # :nocode: :example:
ary = [1, 2, 3]
ary[0] = 5
( p ary ).should eq( [5,2,3] )

expect_raises(IndexError) { ary[3] = 5 }

puts "# array.cr:332 (019.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5]
a[1, 3] = 6
( a ).should eq( [1, 6, 5] )

a = [1, 2, 3, 4, 5]
a[1, 0] = 6
( a ).should eq( [1, 6, 2, 3, 4, 5] )

puts "# array.cr:365 (020.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5]
a[1..3] = 6
( a ).should eq( [1, 6, 5] )

a = [1, 2, 3, 4, 5]
a[1...1] = 6
( a ).should eq( [1, 6, 2, 3, 4, 5] )

puts "# array.cr:380 (021.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5]
a[1, 3] = [6, 7, 8]
( a ).should eq( [1, 6, 7, 8, 5] )

a = [1, 2, 3, 4, 5]
a[1, 3] = [6, 7]
( a ).should eq( [1, 6, 7, 5] )

a = [1, 2, 3, 4, 5]
a[1, 3] = [6, 7, 8, 9, 10]
( a ).should eq( [1, 6, 7, 8, 9, 10, 5] )

puts "# array.cr:423 (022.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5]
a[1..3] = [6, 7, 8]
( a ).should eq( [1, 6, 7, 8, 5] )

a = [1, 2, 3, 4, 5]
a[1..3] = [6, 7]
( a ).should eq( [1, 6, 7, 5] )

a = [1, 2, 3, 4, 5]
a[1..3] = [6, 7, 8, 9, 10]
( a ).should eq( [1, 6, 7, 8, 9, 10, 5] )

puts "# array.cr:448 (023.cr)" # :nocode: :example:
a = ["a", "b", "c", "d", "e"]
( a[1..3] ).should eq( ["b", "c", "d"] )
( a[4..7] ).should eq( ["e"] )
# a[6..10]   # raise IndexError
( a[5..10] ).to_s.should eq( "[]" )
( a[-2...-1] ).should eq( ["d"] )

puts "# array.cr:469 (024.cr)" # :nocode: :example:
a = ["a", "b", "c", "d", "e"]
( a[-3, 3] ).should eq( ["c", "d", "e"] )
# a[6, 1]  # raise IndexError
( a[1, 2] ).should eq( ["b", "c"] )
( a[5, 1] ).to_s.should eq( "[]" )

puts "# array.cr:505 (025.cr)" # :nocode: :example:
a = ["a", "b", "c", "d", "e"]
( a.clear ).to_s.should eq( "[]" )

puts "# array.cr:520 (026.cr)" # :nocode: :example:
ary = [[1, 2], [3, 4]]
ary2 = ary.clone
ary[0][0] = 5
( ary ).should eq( [[5, 2], [3, 4]] )
( ary2 ).should eq( [[1, 2], [3, 4]] )

ary2 << [7, 8]
( ary ).should eq( [[5, 2], [3, 4]] )
( ary2 ).should eq( [[1, 2], [3, 4], [7, 8]] )

puts "# array.cr:537 (027.cr)" # :nocode: :example:
( ["a", nil, "b", nil, "c", nil].compact ).should eq( ["a", "b", "c"] )

puts "# array.cr:546 (028.cr)" # :nocode: :example:
ary = ["a", nil, "b", nil, "c"]
ary.compact!
( ary ).should eq( ["a", "b", "c"] )

puts "# array.cr:557 (029.cr)" # :nocode: :example:
ary = ["a", "b"]
ary.concat(["c", "d"])
( ary ).should eq( ["a", "b", "c", "d"] )

puts "# array.cr:602 (030.cr)" # :nocode: :example:
a = ["a", "b", "b", "b", "c"]
( a.delete("b") ).to_s.should eq( "b" )
( a ).should eq( ["a", "c"] )

( a.delete("x") ).should eq( nil )
( a ).should eq( ["a", "c"] )

puts "# array.cr:617 (031.cr)" # :nocode: :example:
a = ["ant", "bat", "cat", "dog"]
( a.delete_at(2) ).to_s.should eq( "cat" )
( a ).should eq( ["ant", "bat", "dog"] )
expect_raises(IndexError) { a.delete_at(99) }

puts "# array.cr:637 (032.cr)" # :nocode: :example:
a = ["ant", "bat", "cat", "dog"]
( a.delete_at(1..2) ).should eq( ["bat", "cat"] )
( a ).should eq( ["ant", "dog"] )
expect_raises(IndexError) { a.delete_at(99..100) }

puts "# array.cr:653 (033.cr)" # :nocode: :example:
a = ["ant", "bat", "cat", "dog"]
( a.delete_at(1, 2) ).should eq( ["bat", "cat"] )
( a ).should eq( ["ant", "dog"] )
expect_raises(IndexError) { a.delete_at(99, 1) }

puts "# array.cr:673 (034.cr)" # :nocode: :example:
ary = [[1, 2], [3, 4]]
ary2 = ary.dup
ary[0][0] = 5
( ary ).should eq( [[5, 2], [3, 4]] )
( ary2 ).should eq( [[5, 2], [3, 4]] )

ary2 << [7, 8]
( ary ).should eq( [[5, 2], [3, 4]] )
( ary2 ).should eq( [[5, 2], [3, 4], [7, 8]] )

puts "# array.cr:694 (035.cr)" # :nocode: :example:
a = [1, 2, 3, 4]
( a.fill { |i| i * i } ).should eq( [0, 1, 4, 9] )

puts "# array.cr:711 (036.cr)" # :nocode: :example:
a = [1, 2, 3, 4]
( a.fill(2) { |i| i * i } ).should eq( [1, 2, 4, 9] )

puts "# array.cr:734 (037.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5, 6]
( a.fill(2, 2) { |i| i * i } ).should eq( [1, 2, 4, 9, 5, 6] )

puts "# array.cr:753 (038.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5, 6]
( a.fill(2..3) { |i| i * i } ).should eq( [1, 2, 4, 9, 5, 6] )

puts "# array.cr:765 (039.cr)" # :nocode: :example:
a = [1, 2, 3]
( a.fill(9) ).should eq( [9, 9, 9] )

puts "# array.cr:777 (040.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5]
( a.fill(9, 2) ).should eq( [1, 2, 9, 9, 9] )

puts "# array.cr:790 (041.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5]
( a.fill(9, 2, 2) ).should eq( [1, 2, 9, 9, 5] )

puts "# array.cr:802 (042.cr)" # :nocode: :example:
a = [1, 2, 3, 4, 5]
( a.fill(9, 2..3) ).should eq( [1, 2, 9, 9, 5] )

puts "# array.cr:812 (043.cr)" # :nocode: :example:
( [1, 2, 3].first(2) ).should eq( [1, 2] )
( [1, 2, 3].first(4) ).should eq( [1, 2, 3] )

puts "# array.cr:825 (044.cr)" # :nocode: :example:
a = ["a", "b", "c"]
( a.insert(0, "x") ).should eq( ["x", "a", "b", "c"] )
( a.insert(2, "y") ).should eq( ["x", "a", "y", "b", "c"] )
( a.insert(-1, "z") ).should eq( ["x", "a", "y", "b", "c", "z"] )

puts "# array.cr:855 (045.cr)" # :nocode: :example:
( [1, 2, 3].last(2) ).should eq( [2, 3] )
( [1, 2, 3].last(4) ).should eq( [1, 2, 3] )

puts "# array.cr:880 (046.cr)" # :nocode: :example:
a = [1, 2, 3]
a.map! { |x| x * x }
( a ).should eq( [1, 4, 9] )

puts "# array.cr:893 (047.cr)" # :nocode: :example:
ary = [1, 6, 2, 4, 8]
ary.select! { |x| x > 3 }
( ary ).should eq( [6, 4, 8] )

puts "# array.cr:907 (048.cr)" # :nocode: :example:
ary = [1, 6, 2, 4, 8]
ary.select!(3..7)
( ary ).should eq( [6, 4] )

puts "# array.cr:921 (049.cr)" # :nocode: :example:
ary = [1, 6, 2, 4, 8]
ary.reject! { |x| x > 3 }
( ary ).should eq( [1, 2] )

puts "# array.cr:936 (050.cr)" # :nocode: :example:
ary = [1, 6, 2, 4, 8]
ary.reject!(3..7)
( ary ).should eq( [1, 2, 8] )

puts "# array.cr:995 (051.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].skip(3) ).should eq( [4, 5, 6] )

puts "# array.cr:1010 (052.cr)" # :nocode: :example:
a = [1, 2, 3]
( a.permutations ).should eq( [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] )
( a.permutations(1) ).should eq( [[1],[2],[3]] )
( a.permutations(2) ).should eq( [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]] )
( a.permutations(3) ).should eq( [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] )
( a.permutations(0) ).to_s.should eq( "[[]]" )
( a.permutations(4) ).to_s.should eq( "[]" )

puts "# array.cr:1029 (053.cr)" # :nocode: :example:
a = [1, 2, 3]
sums = [] of Int32
( a.each_permutation(2) { |p| sums << p.sum } ).should eq( nil )
( sums ).should eq( [3, 4, 3, 5, 4, 5] )

puts "# array.cr:1078 (054.cr)" # :nocode: :example:
iter = [1, 2, 3].each_permutation
( iter.next ).should eq( [1, 2, 3] )
( iter.next ).should eq( [1, 3, 2] )
( iter.next ).should eq( [2, 1, 3] )
( iter.next ).should eq( [2, 3, 1] )
( iter.next ).should eq( [3, 1, 2] )
( iter.next ).should eq( [3, 2, 1] )
( iter.next ).class.to_s.should eq( "Iterator::Stop" )

puts "# array.cr:1178 (055.cr)" # :nocode: :example:
( s = [1, 2, 3] ).should eq( [1, 2, 3] )
( t = [4, 5, 6, [7, 8]] ).should eq( [4, 5, 6, [7, 8]] )
u = [9, [10, 11].each] # => [9, #<Indexable::ItemIterator>]
a = [s, t, u, 12, 13]  # => [[1, 2, 3], [4, 5, 6, [7, 8]], 9, #<Indexable::ItemIterator>, 12, 13]
( a.flatten ).should eq( [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] )

puts "# array.cr:1314 (056.cr)" # :nocode: :example:
a = ["a", "b", "c"]
( a.pop ).to_s.should eq( "c" )
( a ).should eq( ["a", "b"] )

puts "# array.cr:1326 (057.cr)" # :nocode: :example:
a = [1]
( a.pop { "Testing" } ).should eq( 1 )
( a.pop { "Testing" } ).to_s.should eq( "Testing" )

puts "# array.cr:1348 (058.cr)" # :nocode: :example:
a = ["a", "b", "c"]
( a.pop(2) ).should eq( ["b", "c"] )
( a ).should eq( ["a"] )

a = ["a", "b", "c"]
( a.pop(4) ).should eq( ["a", "b", "c"] )
( a ).to_s.should eq( "[]" )

puts "# array.cr:1393 (059.cr)" # :nocode: :example:
a = ["a", "b"]
( a.push("c") ).should eq( ["a", "b", "c"] )
# a.push(1)   # Errors, because the array only accepts String.

a = ["a", "b"] of (Int32 | String)
( a.push("c") ).should eq( ["a", "b", "c"] )
( a.push(1) ).should eq( ["a", "b", "c", 1] )

puts "# array.cr:1412 (060.cr)" # :nocode: :example:
a = ["a"]
( a.push("b", "c") ).should eq( ["a", "b", "c"] )

puts "# array.cr:1435 (061.cr)" # :nocode: :example:
a = [1, 2, 3]
( a.reverse ).should eq( [3, 2, 1] )

puts "# array.cr:1479 (062.cr)" # :nocode: :example:
a = [1, 2, 3]
a.sample(2)                # => [2, 1]
a.sample(2, Random.new(1)) # => [1, 3]

puts "# array.cr:1517 (063.cr)" # :nocode: :example:
a = ["a", "b", "c"]
( a.shift ).to_s.should eq( "a" )
( a ).should eq( ["b", "c"] )

puts "# array.cr:1544 (064.cr)" # :nocode: :example:
a = ["a", "b", "c"]
( a.shift ).to_s.should eq( "a" )
( a ).should eq( ["b", "c"] )

a = ["a", "b", "c"]
( a.shift(4) ).should eq( ["a", "b", "c"] )
( a ).to_s.should eq( "[]" )

puts "# array.cr:1571 (065.cr)" # :nocode: :example:
a = ["a", "b"]
( a.shift? ).to_s.should eq( "a" )
( a ).should eq( ["b"] )
( a.shift? ).to_s.should eq( "b" )
( a ).to_s.should eq( "[]" )
( a.shift? ).should eq( nil )
( a ).to_s.should eq( "[]" )

puts "# array.cr:1600 (066.cr)" # :nocode: :example:
a = [3, 1, 2]
( a.sort ).should eq( [1, 2, 3] )
( a ).should eq( [3, 1, 2] )

puts "# array.cr:1616 (067.cr)" # :nocode: :example:
a = [3, 1, 2]
b = a.sort { |a, b| b <=> a }

( b ).should eq( [3, 2, 1] )
( a ).should eq( [3, 1, 2] )

puts "# array.cr:1630 (068.cr)" # :nocode: :example:
a = [3, 1, 2]
a.sort!
( a ).should eq( [1, 2, 3] )

puts "# array.cr:1648 (069.cr)" # :nocode: :example:
a = [3, 1, 2]
a.sort! { |a, b| b <=> a }
( a ).should eq( [3, 2, 1] )

puts "# array.cr:1662 (070.cr)" # :nocode: :example:
a = %w(apple pear fig)
b = a.sort_by { |word| word.size }
( b ).should eq( ["fig", "pear", "apple"] )
( a ).should eq( ["apple", "pear", "fig"] )

puts "# array.cr:1676 (071.cr)" # :nocode: :example:
a = %w(apple pear fig)
a.sort_by! { |word| word.size }
( a ).should eq( ["fig", "pear", "apple"] )

puts "# array.cr:1692 (072.cr)" # :nocode: :example:
a = ["first", "second", "third"]
( a.swap(1, 2) ).should eq( ["first", "third", "second"] )
( a ).should eq( ["first", "third", "second"] )
( a.swap(0, -1) ).should eq( ["second", "third", "first"] )
( a ).should eq( ["second", "third", "first"] )
# a.swap(2, 3)  # => raises "Index out of bounds (IndexError)"

puts "# array.cr:1738 (073.cr)" # :nocode: :example:
ary = [1, 2, 3]
( ary.to_unsafe[0] ).should eq( 1 )

puts "# array.cr:1748 (074.cr)" # :nocode: :example:
a = [[:a, :b], [:c, :d], [:e, :f]]
( a.transpose ).should eq( [[:a, :c, :e], [:b, :d, :f]] )
( a ).should eq( [[:a, :b], [:c, :d], [:e, :f]] )

puts "# array.cr:1771 (075.cr)" # :nocode: :example:
a = ["a", "a", "b", "b", "c"]
( a.uniq ).should eq( ["a", "b", "c"] )
( a ).should eq( [ "a", "a", "b", "b", "c" ] )

puts "# array.cr:1783 (076.cr)" # :nocode: :example:
a = [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}]
( a.uniq { |s| s[0] } ).should eq( [{"student", "sam"}, {"teacher", "matz"}] )
( a ).should eq( [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}] )

puts "# array.cr:1799 (077.cr)" # :nocode: :example:
a = ["a", "a", "b", "b", "c"]
( a.uniq! ).should eq( ["a", "b", "c"] )
( a ).should eq( ["a", "b", "c"] )

puts "# array.cr:1810 (078.cr)" # :nocode: :example:
a = [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}]
( a.uniq! { |s| s[0] } ).should eq( [{"student", "sam"}, {"teacher", "matz"}] )
( a ).should eq( [{"student", "sam"}, {"teacher", "matz"}] )

puts "# array.cr:1846 (079.cr)" # :nocode: :example:
a = ["a", "b"]
( a.unshift("c") ).should eq( ["c", "a", "b"] )
# a.unshift(1)   # Errors, because the array only accepts String.

a = ["a", "b"] of (Int32 | String)
( a.unshift("c") ).should eq( ["c", "a", "b"] )
( a.unshift(1) ).should eq( [1, "c", "a", "b"] )


end
