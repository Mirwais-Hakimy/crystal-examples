require "spec"

puts "# enumerable.cr:9 (001.cr)" # :nocode: :example:
class Three
  include Enumerable(Int32)

  def each
    yield 1
    yield 2
    yield 3
  end
end

three = Three.new
( three.to_a ).should eq( [1, 2, 3] )
( three.select &.odd? ).should eq( [1, 3] )
( three.all? { |x| x < 10 } ).should eq( true )

puts "# enumerable.cr:42 (002.cr)" # :nocode: :example:
( ["ant", "bear", "cat"].all? { |word| word.size >= 3 } ).should eq( true )
( ["ant", "bear", "cat"].all? { |word| word.size >= 4 } ).should eq( false )

puts "# enumerable.cr:54 (003.cr)" # :nocode: :example:
( [2, 3, 4].all?(1..5) ).should eq( true )
( [2, 3, 4].all?(Int32) ).should eq( true )
( [2, "a", 3].all?(String) ).should eq( false )
( %w[foo bar baz].all?(/o|a/) ).should eq( true )

puts "# enumerable.cr:66 (004.cr)" # :nocode: :example:
( [nil, true, 99].all? ).should eq( false )
( [15].all? ).should eq( true )

puts "# enumerable.cr:77 (005.cr)" # :nocode: :example:
( ["ant", "bear", "cat"].any? { |word| word.size >= 4 } ).should eq( true )
( ["ant", "bear", "cat"].any? { |word| word.size > 4 } ).should eq( false )

puts "# enumerable.cr:89 (006.cr)" # :nocode: :example:
( [2, 3, 4].any?(1..3) ).should eq( true )
( [2, 3, 4].any?(5..10) ).should eq( false )
( [2, "a", 3].any?(String) ).should eq( true )
( %w[foo bar baz].any?(/a/) ).should eq( true )

puts "# enumerable.cr:101 (007.cr)" # :nocode: :example:
( [nil, true, 99].any? ).should eq( true )
( [nil, false].any? ).should eq( false )

puts "# enumerable.cr:116 (008.cr)" # :nocode: :example:
ary = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunks { |n| n.even? }
( ary ).should eq( [{false, [3, 1]}, {true, [4]}, {false, [1, 5, 9]}, {true, [2, 6]}, {false, [5, 3, 5]}] )

puts "# enumerable.cr:220 (009.cr)" # :nocode: :example:
["Alice", "Bob"].map { |name| name.match(/^A./) }         # => [#<Regex::MatchData "Al">, nil]
["Alice", "Bob"].compact_map { |name| name.match(/^A./) } # => [#<Regex::MatchData "Al">]

puts "# enumerable.cr:238 (010.cr)" # :nocode: :example:
( [1, 2, 3, 4].count { |i| i % 2 == 0 } ).should eq( 2 )

puts "# enumerable.cr:249 (011.cr)" # :nocode: :example:
( [1, 2, 3, 4].count(3) ).should eq( 1 )

puts "# enumerable.cr:269 (012.cr)" # :nocode: :example:
[1, 2, 3, 4, 5].each_cons(2) do |cons|
  puts cons
end

puts "# enumerable.cr:319 (013.cr)" # :nocode: :example:
[1, 2, 3, 4, 5].each_slice(2) do |slice|
  puts slice
end

puts "# enumerable.cr:375 (014.cr)" # :nocode: :example:
["Alice", "Bob"].each_with_index do |user, i|
  puts "User ##{i}: #{user}"
end

puts "# enumerable.cr:391 (015.cr)" # :nocode: :example:
["Alice", "Bob"].each_with_index(1) do |user, i|
  puts "User ##{i}: #{user}"
end

puts "# enumerable.cr:414 (016.cr)" # :nocode: :example:
hash = ["Alice", "Bob"].each_with_object({} of String => Int32) do |user, sizes|
  sizes[user] = user.size
end
( hash ).should eq( {"Alice" => 5, "Bob" => 3} )

puts "# enumerable.cr:432 (017.cr)" # :nocode: :example:
( [1, 2, 3, 4].find { |i| i > 2 } ).should eq( 3 )
( [1, 2, 3, 4].find { |i| i > 8 } ).should eq( nil )
( [1, 2, 3, 4].find(-1) { |i| i > 8 } ).should eq( -1 )

puts "# enumerable.cr:461 (018.cr)" # :nocode: :example:
array = ["Alice", "Bob"].flat_map do |user|
  user.chars
end
( array ).should eq( ['A', 'l', 'i', 'c', 'e', 'B', 'o', 'b'] )

puts "# enumerable.cr:483 (019.cr)" # :nocode: :example:
( ["Alice", "Bob"].grep(/^A/) ).should eq( ["Alice"] )

puts "# enumerable.cr:494 (020.cr)" # :nocode: :example:
( ["Alice", "Bob", "Ary"].group_by { |name| name.size } ).should eq( {5 => ["Alice"], 3 => ["Bob", "Ary"]} )

puts "# enumerable.cr:513 (021.cr)" # :nocode: :example:
( [1, 2, 3].in_groups_of(2, 0) ).should eq( [[1, 2], [3, 0]] )
( [1, 2, 3].in_groups_of(2) ).should eq( [[1, 2], [3, nil]] )

puts "# enumerable.cr:529 (022.cr)" # :nocode: :example:
[1, 2, 4].in_groups_of(2, 0) { |e| p e.sum }
# => 3
# => 4

puts "# enumerable.cr:553 (023.cr)" # :nocode: :example:
( [1, 2, 3].includes?(2) ).should eq( true )
( [1, 2, 3].includes?(5) ).should eq( false )

puts "# enumerable.cr:563 (024.cr)" # :nocode: :example:
( ["Alice", "Bob"].index { |name| name.size < 4 } ).should eq( 1 )

puts "# enumerable.cr:577 (025.cr)" # :nocode: :example:
( ["Alice", "Bob"].index("Alice") ).should eq( 0 )

puts "# enumerable.cr:592 (026.cr)" # :nocode: :example:
["Anna", "Ary", "Alice"].index_by { |e| e.size }
# => {4 => "Anna", 3 => "Ary", 5 => "Alice"}
["Anna", "Ary", "Alice", "Bob"].index_by { |e| e.size }
# => {4 => "Anna", 3 => "Bob", 5 => "Alice"}

puts "# enumerable.cr:613 (027.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5].reduce { |acc, i| acc + i } ).should eq( 15 )

puts "# enumerable.cr:630 (028.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5].reduce(10) { |acc, i| acc + i } ).should eq( 25 )

puts "# enumerable.cr:643 (029.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5].join(", ") ).to_s.should eq( "1, 2, 3, 4, 5" )

puts "# enumerable.cr:655 (030.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5].join(", ") { |i| -i } ).to_s.should eq( "-1, -2, -3, -4, -5" )

puts "# enumerable.cr:668 (031.cr)" # :nocode: :example:
[1, 2, 3, 4, 5].join(", ", STDOUT)

puts "# enumerable.cr:686 (032.cr)" # :nocode: :example:
[1, 2, 3, 4, 5].join(", ", STDOUT) { |i, io| io << "(#{i})" }

puts "# enumerable.cr:704 (033.cr)" # :nocode: :example:
( [1, 2, 3].map { |i| i * 10 } ).should eq( [10, 20, 30] )

puts "# enumerable.cr:715 (034.cr)" # :nocode: :example:
["Alice", "Bob"].map_with_index { |name, i| "User ##{i}: #{name}" }
# => ["User #0: Alice", "User #1: Bob"]

puts "# enumerable.cr:729 (035.cr)" # :nocode: :example:
( [1, 2, 3].max ).should eq( 3 )
( ["Alice", "Bob"].max ).to_s.should eq( "Bob" )

puts "# enumerable.cr:748 (036.cr)" # :nocode: :example:
( ["Alice", "Bob"].max_by { |name| name.size } ).to_s.should eq( "Alice" )

puts "# enumerable.cr:784 (037.cr)" # :nocode: :example:
( ["Alice", "Bob"].max_of { |name| name.size } ).should eq( 5 )

puts "# enumerable.cr:818 (038.cr)" # :nocode: :example:
( [1, 2, 3].min ).should eq( 1 )
( ["Alice", "Bob"].min ).to_s.should eq( "Alice" )

puts "# enumerable.cr:837 (039.cr)" # :nocode: :example:
( ["Alice", "Bob"].min_by { |name| name.size } ).to_s.should eq( "Bob" )

puts "# enumerable.cr:873 (040.cr)" # :nocode: :example:
( ["Alice", "Bob"].min_of { |name| name.size } ).should eq( 3 )

puts "# enumerable.cr:905 (041.cr)" # :nocode: :example:
( [1, 2, 3].minmax ).should eq( {1, 3} )

puts "# enumerable.cr:921 (042.cr)" # :nocode: :example:
( ["Alice", "Bob", "Carl"].minmax_by { |name| name.size } ).should eq( {"Bob", "Alice"} )

puts "# enumerable.cr:964 (043.cr)" # :nocode: :example:
( ["Alice", "Bob", "Carl"].minmax_of { |name| name.size } ).should eq( {3, 5} )

puts "# enumerable.cr:1003 (044.cr)" # :nocode: :example:
( [1, 2, 3].none? { |i| i > 5 } ).should eq( true )

puts "# enumerable.cr:1016 (045.cr)" # :nocode: :example:
( [2, 3, 4].none?(5..7) ).should eq( true )
( [2, "a", 3].none?(String) ).should eq( false )
( %w[foo bar baz].none?(/e/) ).should eq( true )

puts "# enumerable.cr:1027 (046.cr)" # :nocode: :example:
( [nil, false].none? ).should eq( true )
( [nil, false, true].none? ).should eq( false )

puts "# enumerable.cr:1040 (047.cr)" # :nocode: :example:
( [1, 2, 3].one? { |i| i > 2 } ).should eq( true )
( [1, 2, 3].one? { |i| i > 1 } ).should eq( false )

puts "# enumerable.cr:1056 (048.cr)" # :nocode: :example:
( [1, 10, 100].one?(7..14) ).should eq( true )
( [2, "a", 3].one?(Int32) ).should eq( false )
( %w[foo bar baz].one?(/oo/) ).should eq( true )

puts "# enumerable.cr:1068 (049.cr)" # :nocode: :example:
( [1, false, false].one? ).should eq( true )
( [1, false, 3].one? ).should eq( false )
( [1].one? ).should eq( true )
( [false].one? ).should eq( false )

puts "# enumerable.cr:1082 (050.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].partition { |i| i % 2 == 0 } ).should eq( {[2, 4, 6], [1, 3, 5]} )

puts "# enumerable.cr:1097 (051.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].reject { |i| i % 2 == 0 } ).should eq( [1, 3, 5] )

puts "# enumerable.cr:1109 (052.cr)" # :nocode: :example:
ints = [1, true, 3, false].reject(Bool)
( ints ).should eq( [1, 3] )
( typeof(ints) ).should eq( Array(Int32) )

puts "# enumerable.cr:1126 (053.cr)" # :nocode: :example:
[1, 3, 2, 5, 4, 6].reject(3..5).should eq([1, 2, 6])

puts "# enumerable.cr:1136 (054.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].select { |i| i % 2 == 0 } ).should eq( [2, 4, 6] )

puts "# enumerable.cr:1148 (055.cr)" # :nocode: :example:
ints = [1, true, nil, 3, false].select(Int32)
( ints ).should eq( [1, 3] )
( typeof(ints) ).should eq( Array(Int32) )

puts "# enumerable.cr:1162 (056.cr)" # :nocode: :example:
[1, 3, 2, 5, 4, 6].select(3..5).should eq([3, 5, 4])

puts "# enumerable.cr:1171 (057.cr)" # :nocode: :example:
( [1, 2, 3, 4].size ).should eq( 4 )

puts "# enumerable.cr:1183 (058.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].skip(3) ).should eq( [4, 5, 6] )

puts "# enumerable.cr:1200 (059.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 0].skip_while { |i| i < 3 } ).should eq( [3, 4, 5, 0] )

puts "# enumerable.cr:1218 (060.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].sum ).should eq( 21 )

puts "# enumerable.cr:1224 (061.cr)" # :nocode: :example:
( ([] of Int32).sum ).should eq( 0 )

puts "# enumerable.cr:1239 (062.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].sum(7) ).should eq( 28 )

puts "# enumerable.cr:1245 (063.cr)" # :nocode: :example:
( ([] of Int32).sum(7) ).should eq( 7 )

puts "# enumerable.cr:1254 (064.cr)" # :nocode: :example:
( ["Alice", "Bob"].sum { |name| name.size } ).should eq( 8 )

puts "# enumerable.cr:1260 (065.cr)" # :nocode: :example:
( ([] of Int32).sum { |x| x + 1 } ).should eq( 0 )

puts "# enumerable.cr:1271 (066.cr)" # :nocode: :example:
( ["Alice", "Bob"].sum(1) { |name| name.size } ).should eq( 9 )

puts "# enumerable.cr:1277 (067.cr)" # :nocode: :example:
( ([] of String).sum(1) { |name| name.size } ).should eq( 1 )

puts "# enumerable.cr:1289 (068.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].product ).should eq( 720 )

puts "# enumerable.cr:1295 (069.cr)" # :nocode: :example:
( ([] of Int32).product ).should eq( 1 )

puts "# enumerable.cr:1310 (070.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 6].product(7) ).should eq( 5040 )

puts "# enumerable.cr:1316 (071.cr)" # :nocode: :example:
( ([] of Int32).product(7) ).should eq( 7 )

puts "# enumerable.cr:1325 (072.cr)" # :nocode: :example:
( ["Alice", "Bob"].product { |name| name.size } ).should eq( 15 )

puts "# enumerable.cr:1331 (073.cr)" # :nocode: :example:
( ([] of Int32).product { |x| x + 1 } ).should eq( 1 )

puts "# enumerable.cr:1343 (074.cr)" # :nocode: :example:
( ["Alice", "Bob"].product(2) { |name| name.size } ).should eq( 30 )

puts "# enumerable.cr:1349 (075.cr)" # :nocode: :example:
( ([] of String).product(1) { |name| name.size } ).should eq( 1 )

puts "# enumerable.cr:1375 (076.cr)" # :nocode: :example:
( [1, 2, 3, 4, 5, 0].take_while { |i| i < 3 } ).should eq( [1, 2] )

puts "# enumerable.cr:1389 (077.cr)" # :nocode: :example:
( (1..5).to_a ).should eq( [1, 2, 3, 4, 5] )

puts "# enumerable.cr:1401 (078.cr)" # :nocode: :example:
( [[:a, :b], [:c, :d]].to_h ).should eq( {:a => :b, :c => :d} )
( Tuple.new({:a, 1}, {:c, 2}).to_h ).should eq( {:a => 1, :c => 2} )

puts "# enumerable.cr:1413 (079.cr)" # :nocode: :example:
( (1..3).to_h { |i| {i, i ** 2} } ).should eq( {1 => 1, 2 => 4, 3 => 9} )

