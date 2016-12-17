require "spec"

it "set.cr" do
puts # :nocode:

puts "# set.cr:12 (001.cr)" # :nocode: :example:
s1 = Set{1, 2}
s2 = [1, 2].to_set
s3 = Set.new [1, 2]
( s1 == s2 ).should eq( true )
( s1 == s3 ).should eq( true )
s1.add(2)
s1.concat([6, 8])
( s1.subset? s2 ).should eq( false )
( s2.subset? s1 ).should eq( true )

puts "# set.cr:29 (002.cr)" # :nocode: :example:
s = Set(Int32).new
( s.empty? ).should eq( true )

puts "# set.cr:47 (003.cr)" # :nocode: :example:
a = [1, 3, 5]
s = Set.new a
( s.empty? ).should eq( false )

puts "# set.cr:63 (004.cr)" # :nocode: :example:
s = Set{1, 5}
( s.includes? 8 ).should eq( false )
s << 8
( s.includes? 8 ).should eq( true )

puts "# set.cr:76 (005.cr)" # :nocode: :example:
s = Set{1, 5}
s.concat [5, 5, 8, 9]
( s.size ).should eq( 4 )

puts "# set.cr:90 (006.cr)" # :nocode: :example:
s = Set{1, 5}
( s.includes? 5 ).should eq( true )
( s.includes? 9 ).should eq( false )

puts "# set.cr:101 (007.cr)" # :nocode: :example:
s = Set{1, 5}
( s.includes? 5 ).should eq( true )
s.delete 5
( s.includes? 5 ).should eq( false )

puts "# set.cr:114 (008.cr)" # :nocode: :example:
s = Set{1, 5}
( s.size ).should eq( 2 )

puts "# set.cr:124 (009.cr)" # :nocode: :example:
s = Set{1, 5}
( s.size ).should eq( 2 )
s.clear
( s.size ).should eq( 0 )

puts "# set.cr:137 (010.cr)" # :nocode: :example:
s = Set(Int32).new
( s.empty? ).should eq( true )
s << 3
( s.empty? ).should eq( false )

puts "# set.cr:161 (011.cr)" # :nocode: :example:
( Set{1, 1, 3, 5} & Set{1, 2, 3} ).should eq( Set{1, 3} )
( Set{'a', 'b', 'b', 'z'} & Set{'a', 'b', 'c'} ).should eq( Set{'a', 'b'} )

puts "# set.cr:180 (012.cr)" # :nocode: :example:
( Set{1, 1, 3, 5} | Set{1, 2, 3} ).should eq( Set{1, 3, 5, 2} )
( Set{'a', 'b', 'b', 'z'} | Set{'a', 'b', 'c'} ).should eq( Set{'a', 'b', 'z', 'c'} )

puts "# set.cr:196 (013.cr)" # :nocode: :example:
( Set{1, 2, 3, 4, 5} - Set{2, 4} ).should eq( Set{1, 3, 5} )
( Set{'a', 'b', 'b', 'z'} - Set{'a', 'b', 'c'} ).should eq( Set{'z'} )

puts "# set.cr:211 (014.cr)" # :nocode: :example:
( Set{1, 2, 3, 4, 5} - [2, 4] ).should eq( Set{1, 3, 5} )
( Set{'a', 'b', 'b', 'z'} - ['a', 'b', 'c'] ).should eq( Set{'z'} )

puts "# set.cr:222 (015.cr)" # :nocode: :example:
( Set{1, 2, 3, 4, 5} ^ Set{2, 4, 6} ).should eq( Set{1, 3, 5, 6} )
( Set{'a', 'b', 'b', 'z'} ^ Set{'a', 'b', 'c'} ).should eq( Set{'z', 'c'} )

puts "# set.cr:240 (016.cr)" # :nocode: :example:
( Set{1, 2, 3, 4, 5} ^ [2, 4, 6] ).should eq( Set{1, 3, 5, 6} )
( Set{'a', 'b', 'b', 'z'} ^ ['a', 'b', 'c'] ).should eq( Set{'z', 'c'} )

puts "# set.cr:259 (017.cr)" # :nocode: :example:
( Set{'a', 'b', 'b', 'z'}.subtract Set{'a', 'b', 'c'} ).should eq( Set{'z'} )
( Set{1, 2, 3, 4, 5}.subtract [2, 4, 6] ).should eq( Set{1, 3, 5} )

puts "# set.cr:272 (018.cr)" # :nocode: :example:
( Set{1, 5} == Set{1, 5} ).should eq( true )

puts "# set.cr:283 (019.cr)" # :nocode: :example:
red_like = Set{"red", "pink", "violet"}
blue_like = Set{"blue", "azure", "violet"}

case "violet"
when red_like & blue_like
  puts "red & blue like color!"
when red_like
  puts "red like color!"
when blue_like
  puts "blue like color!"
end

puts "# set.cr:318 (020.cr)" # :nocode: :example:
( Set{1, 5}.to_a ).should eq( [1,5] )

puts "# set.cr:340 (021.cr)" # :nocode: :example:
( Set{1, 2, 3}.intersects? Set{4, 5} ).should eq( false )
( Set{1, 2, 3}.intersects? Set{3, 4} ).should eq( true )

puts "# set.cr:364 (022.cr)" # :nocode: :example:
( Set{1, 5}.subset? Set{1, 3, 5} ).should eq( true )
( Set{1, 3, 5}.subset? Set{1, 3, 5} ).should eq( true )

puts "# set.cr:378 (023.cr)" # :nocode: :example:
( Set{1, 5}.proper_subset? Set{1, 3, 5} ).should eq( true )
( Set{1, 3, 5}.proper_subset? Set{1, 3, 5} ).should eq( false )

puts "# set.cr:392 (024.cr)" # :nocode: :example:
( Set{1, 3, 5}.superset? Set{1, 5} ).should eq( true )
( Set{1, 3, 5}.superset? Set{1, 3, 5} ).should eq( true )

puts "# set.cr:405 (025.cr)" # :nocode: :example:
( Set{1, 3, 5}.proper_superset? Set{1, 5} ).should eq( true )
( Set{1, 3, 5}.proper_superset? Set{1, 3, 5} ).should eq( false )


end
