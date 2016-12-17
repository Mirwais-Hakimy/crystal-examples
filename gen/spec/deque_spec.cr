require "spec"

it "deque.cr" do
puts # :nocode:

puts "# deque.cr:38 (001.cr)" # :nocode: :example:
deq = Deque(Int32).new(5)
( deq.size ).should eq( 0 )

puts "# deque.cr:58 (002.cr)" # :nocode: :example:
( Deque.new(3, 'a') ).should eq( Deque{'a', 'a', 'a'} )

puts "# deque.cr:78 (003.cr)" # :nocode: :example:
( Deque.new(3) { |i| (i + 1) ** 2 } ).should eq( Deque{1, 4, 9} )

puts "# deque.cr:96 (004.cr)" # :nocode: :example:
( Deque.new([1, 2, 3]) ).should eq( Deque{1, 2, 3} )

puts "# deque.cr:106 (005.cr)" # :nocode: :example:
deq = Deque{2, 3}
deq.unshift 1
( deq == Deque{1, 2, 3} ).should eq( true )
( deq == Deque{2, 3} ).should eq( false )

puts "# deque.cr:185 (006.cr)" # :nocode: :example:
a = Deque{"a", "b", "b", "b", "c"}
( a.delete("b") ).should eq( true )
( a ).should eq( Deque{"a", "c"} )

puts "# deque.cr:208 (007.cr)" # :nocode: :example:
a = Deque{1, 2, 3}
( a.delete_at(1) ).should eq( 2 )
( a ).should eq( Deque{1, 3} )

puts "# deque.cr:281 (008.cr)" # :nocode: :example:
a = Deque{0, 1, 2}
( a.insert(1, 7) ).should eq( Deque{0, 7, 1, 2} )

puts "# deque.cr:351 (009.cr)" # :nocode: :example:
( Deque{:foo, :bar}.size ).should eq( 2 )

puts "# deque.cr:360 (010.cr)" # :nocode: :example:
a = Deque{1, 2, 3}
( a.pop ).should eq( 3 )
( a ).should eq( Deque{1, 2} )

puts "# deque.cr:401 (011.cr)" # :nocode: :example:
a = Deque{1, 2}
( a.push 3 ).should eq( Deque{1, 2, 3} )

puts "# deque.cr:441 (012.cr)" # :nocode: :example:
a = Deque{1, 2, 3}
( a.shift ).should eq( 1 )
( a ).should eq( Deque{2, 3} )

puts "# deque.cr:492 (013.cr)" # :nocode: :example:
a = Deque{1, 2}
( a.unshift 0 ).should eq( Deque{0, 1, 2} )


end
