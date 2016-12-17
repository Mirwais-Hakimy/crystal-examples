require "spec"

puts "# tuple.cr:9 (001.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'} # Tuple(Int32, String, Char)
( tuple[0] ).should eq( 1 )
( tuple[1] ).to_s.should eq( "hello" )
( tuple[2] ).should eq( 'x' )

puts "# tuple.cr:29 (002.cr)" # :nocode: :example:
def one_and_hello
  {1, "hello"}
end

one, hello = one_and_hello
( one ).should eq( 1 )
( hello ).to_s.should eq( "hello" )

puts "# tuple.cr:43 (003.cr)" # :nocode: :example:
def multiply(string, value)
  string * value
end

tuple = {"hey", 2}
value = multiply(*tuple) # same as multiply tuple[0], tuple[1]
( value ).to_s.should eq( "heyhey" )

puts "# tuple.cr:56 (004.cr)" # :nocode: :example:
def splat_test(*args)
  args
end

tuple = splat_test 1, "hello", 'x'
( tuple.class ).should eq( Tuple(Int32, String, Char) )
( tuple ).should eq( {1, "hello", 'x'} )

puts "# tuple.cr:74 (005.cr)" # :nocode: :example:
( Tuple.new(1, "hello", 'x') ).should eq( {1, "hello", 'x'} )
( Tuple.new ).to_s.should eq( "{}" )

# {}                         # syntax error

puts "# tuple.cr:86 (006.cr)" # :nocode: :example:
# pending by 'file:pendings/tuple/006.cr' # :pending:
# Tuple(String, Int64).from(["world", 2])       # => {"world", 2}
# Tuple(String, Int64).from(["world", 2]).class # => {String, Int64}

puts "# tuple.cr:103 (007.cr)" # :nocode: :example:
# pending by 'file:pendings/tuple/007.cr' # :pending:
# def speak_about(thing : String, n : Int64)
#   "I see #{n} #{thing}s"
# end
# 
# data = JSON.parse(%(["world", 2])).as_a
# speak_about(*{String, Int64}.from(data)) # => "I see 2 worlds"

puts "# tuple.cr:132 (008.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'}
( tuple[0] ).should eq( 1 )
# tuple[3] # compile error: index out of bounds for tuple {Int32, String, Char}

i = 0
( tuple[i] ).should eq( 1 )

i = 3
expect_raises(IndexError) { tuple[i] }

puts "# tuple.cr:149 (009.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'}
( tuple[0]? ).should eq( 1 )
( tuple[3]? ).should eq( nil )

puts "# tuple.cr:160 (010.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'}
( tuple.at(0) ).should eq( 1 )
expect_raises(IndexError) { tuple.at(3) }

puts "# tuple.cr:172 (011.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'}
( tuple.at(0) { 10 } ).should eq( 1 )
( tuple.at(3) { 10 } ).should eq( 10 )

puts "# tuple.cr:187 (012.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'}
tuple.each do |value|
  puts value
end

puts "# tuple.cr:210 (013.cr)" # :nocode: :example:
t1 = {1, "hello"}
t2 = {1.0, "hello"}
t3 = {2, "hello"}

( t1 == t2 ).should eq( true )
( t1 == t3 ).should eq( false )

puts "# tuple.cr:241 (014.cr)" # :nocode: :example:
( {1, 2} === {1, 2} ).should eq( true )
( {1, 2} === {1, 3} ).should eq( false )

puts "# tuple.cr:257 (015.cr)" # :nocode: :example:
( {1, 2} === {1, 2, 3} ).should eq( false )
( {/o+/, "bar"} === {"foo", "bar"} ).should eq( true )

puts "# tuple.cr:285 (016.cr)" # :nocode: :example:
( {"a", "a", "c"} <=> {"a", "b", "c"} ).should eq( -1 )
( {1, 2, 3, 4, 5, 6} <=> {1, 2} ).should eq( +1 )
( {1, 2} <=> {1, 2.0} ).should eq( 0 )

puts "# tuple.cr:331 (017.cr)" # :nocode: :example:
t1 = {1, 2}
t2 = {"foo", "bar"}
t3 = t1 + t2
( t3 ).should eq( {1, 2, "foo", "bar"} )
( typeof(t3) ).should eq( Tuple(Int32, Int32, String, String) )

puts "# tuple.cr:357 (018.cr)" # :nocode: :example:
( {'a', 'b'}.size ).should eq( 2 )

puts "# tuple.cr:366 (019.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'}
( tuple.class.types ).should eq( {Int32, String, Char} )

puts "# tuple.cr:381 (020.cr)" # :nocode: :example:
tuple = {1, "hello"}
( tuple.to_s ).to_s.should eq( "{1, \"hello\"}" )

puts "# tuple.cr:397 (021.cr)" # :nocode: :example:
tuple = {1, 2.5, "a"}
( tuple.map &.to_s ).should eq( {"1", "2.5", "a"} )

puts "# tuple.cr:413 (022.cr)" # :nocode: :example:
tuple = {1, 2.5, "a"}
( tuple.map_with_index { |e, i| "tuple[#{i}]: #{e}" } ).should eq( {"tuple[0]: 1", "tuple[1]: 2.5", "tuple[2]: a"} )

puts "# tuple.cr:429 (023.cr)" # :nocode: :example:
tuple = {1, 2.5, "a"}
( tuple.reverse ).should eq( {"a", 2.5, 1} )

puts "# tuple.cr:445 (024.cr)" # :nocode: :example:
tuple = {1, "hello", 'x'}
tuple.reverse_each do |value|
  puts value
end

puts "# tuple.cr:469 (025.cr)" # :nocode: :example:
tuple = {1, 2.5}
( tuple.first ).should eq( 1 )

puts "# tuple.cr:480 (026.cr)" # :nocode: :example:
tuple = {1, 2.5}
( tuple.first? ).should eq( 1 )

empty = Tuple.new
( empty.first? ).should eq( nil )

puts "# tuple.cr:498 (027.cr)" # :nocode: :example:
tuple = {1, 2.5}
( tuple.last ).try(&.to_f).to_s.should eq( "2.5" )

puts "# tuple.cr:511 (028.cr)" # :nocode: :example:
tuple = {1, 2.5}
( tuple.last? ).try(&.to_f).to_s.should eq( "2.5" )

empty = Tuple.new
( empty.last? ).should eq( nil )

