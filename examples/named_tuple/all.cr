# named_tuple.cr: 27 examples

# named_tuple.cr:9 (001.cr)
language = {name: "Crystal", year: 2011} # NamedTuple(name: String, year: Int32)

language[:name]  # => "Crystal"
language[:year]  # => 2011
# language[:other] # compile time error

# named_tuple.cr:31 (002.cr)
NamedTuple.new(name: "Crystal", year: 2011) #=> {name: "Crystal", year: 2011}
NamedTuple.new # => {}
# {}             # syntax error

# named_tuple.cr:43 (003.cr)
num_or_str = 42.as(Int32 | String)
NamedTuple(name: String, val: Int32).from({"name" => "number", "val" => num_or_str}) # => {name: "number", val: 42}

num_or_str = "a string".as(Int32 | String)
# NamedTuple(name: String, val: Int32).from({"name" => "number", "val" => num_or_str}) # raises TypeCastError (cast from String to Int32 failed)

# named_tuple.cr:62 (004.cr)
require "json"

def speak_about(thing : String, n : Int64)
  "I see #{n} #{thing}s"
end

hash = JSON.parse(%({"thing": "world", "n": 2})).as_h # hash : Hash(String, JSON::Any)
hash = hash.transform_values(&.raw)                   # hash : Hash(String, JSON::Any::Type)

speak_about(**{thing: String, n: Int64}.from(hash)) # => "I see 2 worlds"

# named_tuple.cr:90 (005.cr)
tuple = {name: "Crystal", year: 2011}

key = :name
tuple[key] # => "Crystal"

key = "year"
tuple[key] # => 2011

key = :other
# tuple[key] # raises KeyError

# named_tuple.cr:108 (006.cr)
tuple = {name: "Crystal", year: 2011}

key = :name
tuple[key]? # => "Crystal"

key = "year"
tuple[key] # => 2011

key = :other
tuple[key]? # => nil

# named_tuple.cr:127 (007.cr)
h = {a: {b: [10, 20, 30]}}
h.dig? "a", "b"                # => [10, 20, 30]
h.dig? "a", "b", "c", "d", "e" # => nil

# named_tuple.cr:146 (008.cr)
h = {a: {b: [10, 20, 30]}}
h.dig "a", "b"                # => [10, 20, 30]
# h.dig "a", "b", "c", "d", "e" # raises KeyError

# named_tuple.cr:165 (009.cr)
tuple = {name: "Crystal", year: 2011}
tuple.fetch(:name, "Unknown") # => "Crystal"
tuple.fetch("year", 0)        # => 2011
tuple.fetch(:other, 0)        # => 0

# named_tuple.cr:177 (010.cr)
tuple = {name: "Crystal", year: 2011}
tuple.fetch(:name) { "Unknown" } # => "Crystal"
tuple.fetch(:other) { 0 }        # => 0

# named_tuple.cr:191 (011.cr)
tuple = {name: "Crystal", year: 2011}
tuple.fetch("name") { "Unknown" } # => "Crystal"
tuple.fetch("other") { 0 }        # => 0

# named_tuple.cr:206 (012.cr)
a = {foo: "Hello", bar: "Old"}
b = {bar: "New", baz: "Bye"}
a.merge(b) # => {foo: "Hello", bar: "New", baz: "Bye"}

# named_tuple.cr:239 (013.cr)
tuple = {a: 1, b: "hello", c: 'x'}
tuple.class.types # => {a: Int32, b: String, c: Char}

# named_tuple.cr:254 (014.cr)
tuple = {name: "Crystal", year: 2011}
tuple.keys # => {:name, :year}

# named_tuple.cr:280 (015.cr)
tuple = {name: "Crystal", year: 2011}
tuple.values # => {"Crystal", 2011}

# named_tuple.cr:296 (016.cr)
tuple = {name: "Crystal", year: 2011}
tuple.has_key?(:name)  # => true
tuple.has_key?(:other) # => false

# named_tuple.cr:318 (017.cr)
tuple = {name: "Crystal", year: 2011}
tuple.to_s # => %({name: "Crystal", year: 2011})

# named_tuple.cr:365 (018.cr)
tuple = {name: "Crystal", year: 2011}
tuple.each do |key, value|
  puts "#{key} = #{value}"
end

# named_tuple.cr:386 (019.cr)
tuple = {name: "Crystal", year: 2011}
tuple.each_key do |key|
  puts key
end

# named_tuple.cr:407 (020.cr)
tuple = {name: "Crystal", year: 2011}
tuple.each_value do |value|
  puts value
end

# named_tuple.cr:428 (021.cr)
tuple = {name: "Crystal", year: 2011}
tuple.each_with_index do |key, value, i|
  puts "#{i + 1}) #{key} = #{value}"
end

# named_tuple.cr:452 (022.cr)
tuple = {name: "Crystal", year: 2011}
tuple.map { |k, v| "#{k}: #{v}" } # => ["name: Crystal", "year: 2011"]

# named_tuple.cr:466 (023.cr)
tuple = {name: "Crystal", year: 2011}
tuple.to_a # => [{:name, "Crystal"}, {:year, 2011}]

# named_tuple.cr:480 (024.cr)
tuple = {name: "Crystal", year: 2011}
tuple.to_h # => {:name => "Crystal", :year => 2011}

# named_tuple.cr:498 (025.cr)
tuple = {name: "Crystal", year: 2011}
tuple.size # => 2

# named_tuple.cr:508 (026.cr)
tuple = {name: "Crystal", year: 2011}
tuple.empty? # => false

# named_tuple.cr:519 (027.cr)
tuple1 = {name: "Crystal", year: 2011}
tuple2 = {year: 2011, name: "Crystal"}
tuple3 = {name: "Crystal", year: 2012}
tuple4 = {name: "Crystal", year: 2011.0}

tuple1 == tuple2 # => true
tuple1 == tuple3 # => false
tuple1 == tuple4 # => true
