require "spec"

it "atomic.cr" do
puts # :nocode:

puts "# atomic.cr:22 (001.cr)" # :nocode: :example:
atomic = Atomic.new(1)

( atomic.compare_and_set(2, 3) ).should eq( {1, false} )
( atomic.get ).should eq( 1 )

( atomic.compare_and_set(1, 3) ).should eq( {1, true} )
( atomic.get ).should eq( 3 )

puts "# atomic.cr:50 (002.cr)" # :nocode: :example:
atomic = Atomic.new(1)
( atomic.add(2) ).should eq( 1 )
( atomic.get ).should eq( 3 )

puts "# atomic.cr:61 (003.cr)" # :nocode: :example:
atomic = Atomic.new(9)
( atomic.sub(2) ).should eq( 9 )
( atomic.get ).should eq( 7 )

puts "# atomic.cr:72 (004.cr)" # :nocode: :example:
atomic = Atomic.new(5)
( atomic.and(3) ).should eq( 5 )
( atomic.get ).should eq( 1 )

puts "# atomic.cr:83 (005.cr)" # :nocode: :example:
atomic = Atomic.new(5)
( atomic.nand(3) ).should eq( 5 )
( atomic.get ).should eq( -2 )

puts "# atomic.cr:94 (006.cr)" # :nocode: :example:
atomic = Atomic.new(5)
( atomic.or(2) ).should eq( 5 )
( atomic.get ).should eq( 7 )

puts "# atomic.cr:105 (007.cr)" # :nocode: :example:
atomic = Atomic.new(5)
( atomic.xor(3) ).should eq( 5 )
( atomic.get ).should eq( 6 )

puts "# atomic.cr:116 (008.cr)" # :nocode: :example:
atomic = Atomic.new(5)

( atomic.max(3) ).should eq( 5 )
( atomic.get ).should eq( 5 )

( atomic.max(10) ).should eq( 5 )
( atomic.get ).should eq( 10 )

puts "# atomic.cr:135 (009.cr)" # :nocode: :example:
atomic = Atomic.new(5)

( atomic.min(10) ).should eq( 5 )
( atomic.get ).should eq( 5 )

( atomic.min(3) ).should eq( 5 )
( atomic.get ).should eq( 3 )

puts "# atomic.cr:154 (010.cr)" # :nocode: :example:
atomic = Atomic.new(5)
( atomic.swap(10) ).should eq( 5 )
( atomic.get ).should eq( 10 )

puts "# atomic.cr:170 (011.cr)" # :nocode: :example:
atomic = Atomic.new(5)
( atomic.set(10) ).should eq( 10 )
( atomic.get ).should eq( 10 )

puts "# atomic.cr:182 (012.cr)" # :nocode: :example:
atomic = Atomic.new(5)
( atomic.lazy_set(10) ).should eq( 10 )
( atomic.get ).should eq( 10 )


end
