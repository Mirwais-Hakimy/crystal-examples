require "spec"

it "indexable.cr" do
puts # :nocode:

puts "# indexable.cr:31 (001.cr)" # :nocode: :example:
a = [:foo, :bar]
( a.fetch(0) { :default_value } ).should eq( :foo )
( a.fetch(2) { :default_value } ).should eq( :default_value )
( a.fetch(2) { |index| index * 3 } ).should eq( 6 )

puts "# indexable.cr:46 (002.cr)" # :nocode: :example:
a = [:foo, :bar]
( a.fetch(0, :default_value) ).should eq( :foo )
( a.fetch(2, :default_value) ).should eq( :default_value )

puts "# indexable.cr:61 (003.cr)" # :nocode: :example:
ary = ['a', 'b', 'c']
( ary[0] ).should eq( 'a' )
( ary[2] ).should eq( 'c' )
( ary[-1] ).should eq( 'c' )
( ary[-2] ).should eq( 'b' )

expect_raises(IndexError) { ary[3] }
expect_raises(IndexError) { ary[-4] }

puts "# indexable.cr:81 (004.cr)" # :nocode: :example:
ary = ['a', 'b', 'c']
( ary[0]? ).should eq( 'a' )
( ary[2]? ).should eq( 'c' )
( ary[-1]? ).should eq( 'c' )
( ary[-2]? ).should eq( 'b' )

ary[3]?  # nil
ary[-4]? # nil

puts "# indexable.cr:99 (005.cr)" # :nocode: :example:
ary = [{1, 2, 3, {4, 5, 6}}]
( ary.dig?(0, 3, 2) ).should eq( 6 )
( ary.dig?(0, 3, 3) ).should eq( nil )

puts "# indexable.cr:118 (006.cr)" # :nocode: :example:
ary = [{1, 2, 3, {4, 5, 6}}]
( ary.dig(0, 3, 2) ).should eq( 6 )
expect_raises(IndexError) { ary.dig(0, 3, 3) }

puts "# indexable.cr:146 (007.cr)" # :nocode: :example:
( [2, 5, 7, 10].bsearch { |x| x >= 4 } ).should eq( 5 )
( [2, 5, 7, 10].bsearch { |x| x > 10 } ).should eq( nil )

puts "# indexable.cr:165 (008.cr)" # :nocode: :example:
( [2, 5, 7, 10].bsearch_index { |x, i| x >= 4 } ).should eq( 1 )
( [2, 5, 7, 10].bsearch_index { |x, i| x > 10 } ).should eq( nil )

puts "# indexable.cr:176 (009.cr)" # :nocode: :example:
a = ["a", "b", "c"]
a.each { |x| print x, " -- " }

puts "# indexable.cr:194 (010.cr)" # :nocode: :example:
a = ["a", "b", "c"]
iter = a.each
( iter.next ).to_s.should eq( "a" )
( iter.next ).to_s.should eq( "b" )

puts "# indexable.cr:216 (011.cr)" # :nocode: :example:
array = ["a", "b", "c", "d", "e"]
array.each(start: 1, count: 3) { |x| print x, " -- " }

puts "# indexable.cr:237 (012.cr)" # :nocode: :example:
array = ["a", "b", "c", "d", "e"]
array.each(within: 1..3) { |x| print x, " -- " }

puts "# indexable.cr:255 (013.cr)" # :nocode: :example:
a = ["a", "b", "c"]
a.each_index { |x| print x, " -- " }

puts "# indexable.cr:275 (014.cr)" # :nocode: :example:
a = ["a", "b", "c"]
iter = a.each_index
( iter.next ).should eq( 0 )
( iter.next ).should eq( 1 )

puts "# indexable.cr:297 (015.cr)" # :nocode: :example:
array = ["a", "b", "c", "d", "e"]
array.each_index(start: -3, count: 2) { |x| print x, " -- " }

puts "# indexable.cr:388 (016.cr)" # :nocode: :example:
( {1, 2, 3}.to_a ).should eq( [1, 2, 3] )

puts "# indexable.cr:399 (017.cr)" # :nocode: :example:
( ([] of Int32).empty? ).should eq( true )
( ([1]).empty? ).should eq( false )

puts "# indexable.cr:423 (018.cr)" # :nocode: :example:
a = [1, 2, 3]
b = ["a", "ab", "abc"]
( a.equals?(b) { |x, y| x == y.size } ).should eq( true )
( a.equals?(b) { |x, y| x == y } ).should eq( false )

puts "# indexable.cr:439 (019.cr)" # :nocode: :example:
( ([1, 2, 3]).first ).should eq( 1 )
expect_raises(IndexError) { ([] of Int32).first }

puts "# indexable.cr:449 (020.cr)" # :nocode: :example:
( ([1, 2, 3]).first { 4 } ).should eq( 1 )
( ([] of Int32).first { 4 } ).should eq( 4 )

puts "# indexable.cr:459 (021.cr)" # :nocode: :example:
( ([1, 2, 3]).first? ).should eq( 1 )
( ([] of Int32).first? ).should eq( nil )

puts "# indexable.cr:479 (022.cr)" # :nocode: :example:
( [1, 2, 3, 1, 2, 3].index(2, offset: 2) ).should eq( 4 )

puts "# indexable.cr:490 (023.cr)" # :nocode: :example:
( [1, 2, 3, 1, 2, 3].index(offset: 2) { |x| x < 2 } ).should eq( 3 )

puts "# indexable.cr:507 (024.cr)" # :nocode: :example:
( ([1, 2, 3]).last ).should eq( 3 )
expect_raises(IndexError) { ([] of Int32).last }

puts "# indexable.cr:517 (025.cr)" # :nocode: :example:
( ([1, 2, 3]).last { 4 } ).should eq( 3 )
( ([] of Int32).last { 4 } ).should eq( 4 )

puts "# indexable.cr:527 (026.cr)" # :nocode: :example:
( ([1, 2, 3]).last? ).should eq( 3 )
( ([] of Int32).last? ).should eq( nil )

puts "# indexable.cr:553 (027.cr)" # :nocode: :example:
( [1, 2, 3, 2, 3].rindex(2) ).should eq( 3 )
( [1, 2, 3, 2, 3].rindex(2, offset: 2) ).should eq( 1 )

puts "# indexable.cr:568 (028.cr)" # :nocode: :example:
( [1, 2, 3, 2, 3].rindex { |x| x < 3 } ).should eq( 3 )
( [1, 2, 3, 2, 3].rindex(offset: 2) { |x| x < 3 } ).should eq( 1 )

puts "# indexable.cr:587 (029.cr)" # :nocode: :example:
a = [1, 2, 3]
a.sample                # => 2
a.sample                # => 1
a.sample(Random.new(1)) # => 3

puts "# indexable.cr:601 (030.cr)" # :nocode: :example:
( ["a", "b", "c", "d"].values_at(0, 2) ).should eq( {"a", "c"} )

puts "# indexable.cr:613 (031.cr)" # :nocode: :example:
a = [1, 2, 3]
b = ["a", "b", "c"]

a.zip(b) { |x, y| puts "#{x} -- #{y}" }

puts "# indexable.cr:638 (032.cr)" # :nocode: :example:
a = [1, 2, 3]
b = ["a", "b", "c"]

( a.zip(b) ).should eq( [{1, "a"}, {2, "b"}, {3, "c"}] )

puts "# indexable.cr:655 (033.cr)" # :nocode: :example:
a = [1, 2, 3]
b = ["a", "b"]

a.zip?(b) { |x, y| puts "#{x} -- #{y}" }

puts "# indexable.cr:680 (034.cr)" # :nocode: :example:
a = [1, 2, 3]
b = ["a", "b"]

( a.zip?(b) ).should eq( [{1, "a"}, {2, "b"}, {3, nil}] )


end
