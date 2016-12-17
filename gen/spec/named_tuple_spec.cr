require "spec"
require "json"
puts "# named_tuple.cr:9 (001.cr)" # :nocode: :example:
language = {name: "Crystal", year: 2011} # NamedTuple(name: String, year: Int32)

( language[:name] ).to_s.should eq( "Crystal" )
( language[:year] ).should eq( 2011 )
# language[:other] # compile time error

puts "# named_tuple.cr:31 (002.cr)" # :nocode: :example:
( NamedTuple.new(name: "Crystal", year: 2011) ).should eq( {name: "Crystal", year: 2011} )
( NamedTuple.new ).to_s.should eq( "{}" )
# {}             # syntax error

puts "# named_tuple.cr:43 (003.cr)" # :nocode: :example:
num_or_str = 42.as(Int32 | String)
( NamedTuple(name: String, val: Int32).from({"name" => "number", "val" => num_or_str}) ).should eq( {name: "number", val: 42} )

num_or_str = "a string".as(Int32 | String)
expect_raises(TypeCastError) { NamedTuple(name: String, val: Int32).from({"name" => "number", "val" => num_or_str}) }

puts "# named_tuple.cr:62 (004.cr)" # :nocode: :example:
# require "json"

def speak_about(thing : String, n : Int64)
  "I see #{n} #{thing}s"
end

hash = JSON.parse(%({"thing": "world", "n": 2})).as_h # hash : Hash(String, JSON::Any)
hash = hash.transform_values(&.raw)                   # hash : Hash(String, JSON::Any::Type)

( speak_about(**{thing: String, n: Int64}.from(hash)) ).to_s.should eq( "I see 2 worlds" )

puts "# named_tuple.cr:90 (005.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}

key = :name
( tuple[key] ).to_s.should eq( "Crystal" )

key = "year"
( tuple[key] ).should eq( 2011 )

key = :other
expect_raises(KeyError) { tuple[key] }

puts "# named_tuple.cr:108 (006.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}

key = :name
( tuple[key]? ).to_s.should eq( "Crystal" )

key = "year"
( tuple[key] ).should eq( 2011 )

key = :other
( tuple[key]? ).should eq( nil )

puts "# named_tuple.cr:127 (007.cr)" # :nocode: :example:
h = {a: {b: [10, 20, 30]}}
( h.dig? "a", "b" ).should eq( [10, 20, 30] )
( h.dig? "a", "b", "c", "d", "e" ).should eq( nil )

puts "# named_tuple.cr:146 (008.cr)" # :nocode: :example:
h = {a: {b: [10, 20, 30]}}
( h.dig "a", "b" ).should eq( [10, 20, 30] )
expect_raises(KeyError) { h.dig "a", "b", "c", "d", "e" }

puts "# named_tuple.cr:165 (009.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.fetch(:name, "Unknown") ).to_s.should eq( "Crystal" )
( tuple.fetch("year", 0) ).should eq( 2011 )
( tuple.fetch(:other, 0) ).should eq( 0 )

puts "# named_tuple.cr:177 (010.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.fetch(:name) { "Unknown" } ).to_s.should eq( "Crystal" )
( tuple.fetch(:other) { 0 } ).should eq( 0 )

puts "# named_tuple.cr:191 (011.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.fetch("name") { "Unknown" } ).to_s.should eq( "Crystal" )
( tuple.fetch("other") { 0 } ).should eq( 0 )

puts "# named_tuple.cr:206 (012.cr)" # :nocode: :example:
a = {foo: "Hello", bar: "Old"}
b = {bar: "New", baz: "Bye"}
( a.merge(b) ).should eq( {foo: "Hello", bar: "New", baz: "Bye"} )

puts "# named_tuple.cr:239 (013.cr)" # :nocode: :example:
tuple = {a: 1, b: "hello", c: 'x'}
( tuple.class.types ).should eq( {a: Int32, b: String, c: Char} )

puts "# named_tuple.cr:254 (014.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.keys ).should eq( {:name, :year} )

puts "# named_tuple.cr:280 (015.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.values ).should eq( {"Crystal", 2011} )

puts "# named_tuple.cr:296 (016.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.has_key?(:name) ).should eq( true )
( tuple.has_key?(:other) ).should eq( false )

puts "# named_tuple.cr:318 (017.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.to_s ).should eq( %({name: "Crystal", year: 2011}) )

puts "# named_tuple.cr:365 (018.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
tuple.each do |key, value|
  puts "#{key} = #{value}"
end

puts "# named_tuple.cr:386 (019.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
tuple.each_key do |key|
  puts key
end

puts "# named_tuple.cr:407 (020.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
tuple.each_value do |value|
  puts value
end

puts "# named_tuple.cr:428 (021.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
tuple.each_with_index do |key, value, i|
  puts "#{i + 1}) #{key} = #{value}"
end

puts "# named_tuple.cr:452 (022.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.map { |k, v| "#{k}: #{v}" } ).should eq( ["name: Crystal", "year: 2011"] )

puts "# named_tuple.cr:466 (023.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.to_a ).should eq( [{:name, "Crystal"}, {:year, 2011}] )

puts "# named_tuple.cr:480 (024.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.to_h ).should eq( {:name => "Crystal", :year => 2011} )

puts "# named_tuple.cr:498 (025.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.size ).should eq( 2 )

puts "# named_tuple.cr:508 (026.cr)" # :nocode: :example:
tuple = {name: "Crystal", year: 2011}
( tuple.empty? ).should eq( false )

puts "# named_tuple.cr:519 (027.cr)" # :nocode: :example:
tuple1 = {name: "Crystal", year: 2011}
tuple2 = {year: 2011, name: "Crystal"}
tuple3 = {name: "Crystal", year: 2012}
tuple4 = {name: "Crystal", year: 2011.0}

( tuple1 == tuple2 ).should eq( true )
( tuple1 == tuple3 ).should eq( false )
( tuple1 == tuple4 ).should eq( true )

