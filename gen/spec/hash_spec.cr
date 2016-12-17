require "spec"

it "hash.cr" do
puts # :nocode:

puts "# hash.cr:18 (001.cr)" # :nocode: :example:
proc = ->(hash : Hash(String, Int32), key : String) { hash[key] = key.size }
hash = Hash(String, Int32).new(proc)

( hash.size ).should eq( 0 )
( hash["foo"] ).should eq( 3 )
( hash.size ).should eq( 1 )
hash["bar"] = 10
( hash["bar"] ).should eq( 10 )

puts "# hash.cr:46 (002.cr)" # :nocode: :example:
hash = Hash(String, Int32).new do |hash, key|
  hash[key] = key.size
end

( hash.size ).should eq( 0 )
( hash["foo"] ).should eq( 3 )
( hash.size ).should eq( 1 )
hash["bar"] = 10
( hash["bar"] ).should eq( 10 )

puts "# hash.cr:69 (003.cr)" # :nocode: :example:
inventory = Hash(String, Int32).new(0)
inventory["socks"] = 3
( inventory["pickles"] ).should eq( 0 )

puts "# hash.cr:76 (004.cr)" # :nocode: :example:
arr = [1, 2, 3]
hash = Hash(String, Array(Int32)).new(arr)
hash["3"][1] = 4
( arr ).should eq( [1, 4, 3] )

puts "# hash.cr:94 (005.cr)" # :nocode: :example:
h = {} of String => String
h["foo"] = "bar"
( h["foo"] ).to_s.should eq( "bar" )

puts "# hash.cr:121 (006.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h["foo"] ).to_s.should eq( "bar" )

h = Hash(String, String).new("bar")
( h["foo"] ).to_s.should eq( "bar" )

h = Hash(String, String).new { "bar" }
( h["foo"] ).to_s.should eq( "bar" )

h = Hash(String, String).new
expect_raises(KeyError) { h["foo"] }

puts "# hash.cr:147 (007.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h["foo"]? ).to_s.should eq( "bar" )
( h["bar"]? ).should eq( nil )

h = Hash(String, String).new("bar")
( h["foo"]? ).should eq( nil )

puts "# hash.cr:162 (008.cr)" # :nocode: :example:
h = {"a" => {"b" => [10, 20, 30]}}
( h.dig? "a", "b" ).should eq( [10, 20, 30] )
( h.dig? "a", "b", "c", "d", "e" ).should eq( nil )

puts "# hash.cr:181 (009.cr)" # :nocode: :example:
h = {"a" => {"b" => [10, 20, 30]}}
( h.dig "a", "b" ).should eq( [10, 20, 30] )
expect_raises(KeyError) { h.dig "a", "b", "c", "d", "e" }

puts "# hash.cr:200 (010.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h.has_key?("foo") ).should eq( true )
( h.has_key?("bar") ).should eq( false )

puts "# hash.cr:211 (011.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h.has_value?("foo") ).should eq( false )
( h.has_value?("bar") ).should eq( true )

puts "# hash.cr:226 (012.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h.fetch("foo", "foo") ).to_s.should eq( "bar" )
( h.fetch("bar", "foo") ).to_s.should eq( "foo" )

puts "# hash.cr:237 (013.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h.fetch("foo") { "default value" } ).to_s.should eq( "bar" )
( h.fetch("bar") { "default value" } ).to_s.should eq( "default value" )
( h.fetch("bar") { |key| key.upcase } ).to_s.should eq( "BAR" )

puts "# hash.cr:251 (014.cr)" # :nocode: :example:
( {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.values_at("a", "c") ).should eq( {1, 3} )

puts "# hash.cr:260 (015.cr)" # :nocode: :example:
hash = {"foo" => "bar", "baz" => "qux"}
( hash.key_for("bar") ).to_s.should eq( "foo" )
( hash.key_for("qux") ).to_s.should eq( "baz" )
expect_raises(KeyError) { hash.key_for("foobar") }

puts "# hash.cr:272 (016.cr)" # :nocode: :example:
hash = {"foo" => "bar", "baz" => "qux"}
( hash.key_for?("bar") ).to_s.should eq( "foo" )
( hash.key_for?("qux") ).to_s.should eq( "baz" )
( hash.key_for?("foobar") ).should eq( nil )

puts "# hash.cr:284 (017.cr)" # :nocode: :example:
hash = {"foo" => "bar"}
( hash.key_for("bar") { |value| value.upcase } ).to_s.should eq( "foo" )
( hash.key_for("qux") { |value| value.upcase } ).to_s.should eq( "QUX" )

puts "# hash.cr:298 (018.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h.delete("foo") ).to_s.should eq( "bar" )
( h.fetch("foo", nil) ).should eq( nil )

puts "# hash.cr:309 (019.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h.delete("foo") { |key| "#{key} not found" } ).to_s.should eq( "bar" )
( h.fetch("foo", nil) ).should eq( nil )
( h.delete("baz") { |key| "#{key} not found" } ).to_s.should eq( "baz not found" )

puts "# hash.cr:357 (020.cr)" # :nocode: :example:
h = {"foo" => "bar", "fob" => "baz", "bar" => "qux"}
h.delete_if { |key, value| key.starts_with?("fo") }
( h ).should eq( { "bar" => "qux" } )

puts "# hash.cr:375 (021.cr)" # :nocode: :example:
h = Hash(String, String).new
( h.empty? ).should eq( true )

h = {"foo" => "bar"}
( h.empty? ).should eq( false )

puts "# hash.cr:388 (022.cr)" # :nocode: :example:
h = {"foo" => "bar"}

h.each do |key, value|
(   key ).to_s.should eq( "foo" )
(   value ).to_s.should eq( "bar" )
end

h.each do |key_and_value|
(   key_and_value ).should eq( {"foo", "bar"} )
end

puts "# hash.cr:411 (023.cr)" # :nocode: :example:
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each

( iterator.next ).should eq( {"foo", "bar"} )
( iterator.next ).should eq( {"baz", "qux"} )

puts "# hash.cr:424 (024.cr)" # :nocode: :example:
h = {"foo" => "bar"}
h.each_key do |key|
(   key ).to_s.should eq( "foo" )
end

puts "# hash.cr:439 (025.cr)" # :nocode: :example:
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each_key

key = iterator.next
( key ).to_s.should eq( "foo" )

key = iterator.next
( key ).to_s.should eq( "baz" )

puts "# hash.cr:455 (026.cr)" # :nocode: :example:
h = {"foo" => "bar"}
h.each_value do |value|
(   value ).to_s.should eq( "bar" )
end

puts "# hash.cr:470 (027.cr)" # :nocode: :example:
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each_value

value = iterator.next
( value ).to_s.should eq( "bar" )

value = iterator.next
( value ).to_s.should eq( "qux" )

puts "# hash.cr:486 (028.cr)" # :nocode: :example:
h = {"foo" => "bar", "baz" => "bar"}
( h.keys ).should eq( ["foo", "baz"] )

puts "# hash.cr:498 (029.cr)" # :nocode: :example:
h = {"foo" => "bar", "baz" => "qux"}
( h.values ).should eq( ["bar", "qux"] )

puts "# hash.cr:511 (030.cr)" # :nocode: :example:
h = {"foo" => "bar", "baz" => "qux"}
( h.key_index("foo") ).should eq( 0 )
( h.key_index("qux") ).should eq( nil )

puts "# hash.cr:526 (031.cr)" # :nocode: :example:
hash = {"foo" => "bar"}
hash.merge({"baz" => "qux"})
# => {"foo" => "bar", "baz" => "qux"}
hash
# => {"foo" => "bar"}

puts "# hash.cr:549 (032.cr)" # :nocode: :example:
hash = {"foo" => "bar"}
hash.merge!({"baz" => "qux"})
( hash ).should eq( {"foo" => "bar", "baz" => "qux"} )

puts "# hash.cr:573 (033.cr)" # :nocode: :example:
h = {"a" => 100, "b" => 200, "c" => 300}
( h.select { |k, v| k > "a" } ).should eq( {"b" => 200, "c" => 300} )
( h.select { |k, v| v < 200 } ).should eq( {"a" => 100} )

puts "# hash.cr:588 (034.cr)" # :nocode: :example:
h = {"a" => 100, "b" => 200, "c" => 300}
( h.reject { |k, v| k > "a" } ).should eq( {"a" => 100} )
( h.reject { |k, v| v < 200 } ).should eq( {"b" => 200, "c" => 300} )

puts "# hash.cr:610 (035.cr)" # :nocode: :example:
( {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.reject("a", "c") ).should eq( {"b" => 2, "d" => 4} )

puts "# hash.cr:620 (036.cr)" # :nocode: :example:
h = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.reject!("a", "c")
( h ).should eq( {"b" => 2, "d" => 4} )

puts "# hash.cr:635 (037.cr)" # :nocode: :example:
( {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.select("a", "c") ).should eq( {"a" => 1, "c" => 3} )

puts "# hash.cr:650 (038.cr)" # :nocode: :example:
h = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.select!("a", "c")
( h ).should eq( {"a" => 1, "c" => 3} )

puts "# hash.cr:665 (039.cr)" # :nocode: :example:
hash = {"hello" => "world", "foo" => nil}
( hash.compact ).should eq( {"hello" => "world"} )

puts "# hash.cr:677 (040.cr)" # :nocode: :example:
hash = {"hello" => "world", "foo" => nil}
( hash.compact! ).should eq( {"hello" => "world"} )
( hash.compact! ).should eq( nil )

puts "# hash.cr:689 (041.cr)" # :nocode: :example:
hash = {:a => 1, :b => 2, :c => 3}
( hash.transform_keys { |key| key.to_s } ).should eq( {"A" => 1, "B" => 2, "C" => 3} )

puts "# hash.cr:702 (042.cr)" # :nocode: :example:
hash = {:a => 1, :b => 2, :c => 3}
( hash.transform_values { |value| value + 1 } ).should eq( {:a => 2, :b => 3, :c => 4} )

puts "# hash.cr:715 (043.cr)" # :nocode: :example:
hash = {:a => 1, :b => 2, :c => 3}
hash.transform_values! { |value| value + 1 }
( hash ).should eq( {:a => 2, :b => 3, :c => 4} )

puts "# hash.cr:730 (044.cr)" # :nocode: :example:
Hash.zip(["key1", "key2", "key3"], ["value1", "value2", "value3"])
# => {"key1" => "value1", "key2" => "value2", "key3" => "value3"}

puts "# hash.cr:749 (045.cr)" # :nocode: :example:
hash = {"foo1" => "bar1", "foz2" => "baz2"}
( hash.first_key? ).to_s.should eq( "foo1" )
hash.clear
( hash.first_key? ).should eq( nil )

puts "# hash.cr:766 (046.cr)" # :nocode: :example:
hash = {"foo1" => "bar1", "foz2" => "baz2"}
( hash.first_value? ).to_s.should eq( "bar1" )
hash.clear
( hash.first_value? ).should eq( nil )

puts "# hash.cr:783 (047.cr)" # :nocode: :example:
hash = {"foo1" => "bar1", "foz2" => "baz2"}
( hash.last_key? ).to_s.should eq( "foz2" )
hash.clear
( hash.last_key? ).should eq( nil )

puts "# hash.cr:800 (048.cr)" # :nocode: :example:
hash = {"foo1" => "bar1", "foz2" => "baz2"}
( hash.last_value? ).to_s.should eq( "baz2" )
hash.clear
( hash.last_value? ).should eq( nil )

puts "# hash.cr:813 (049.cr)" # :nocode: :example:
hash = {"foo" => "bar", "baz" => "qux"}
( hash.shift ).should eq( {"foo", "bar"} )
( hash ).should eq( {"baz" => "qux"} )

hash = {} of String => String
expect_raises(IndexError) { hash.shift }

puts "# hash.cr:827 (050.cr)" # :nocode: :example:
hash = {"foo" => "bar", "baz" => "qux"}
( hash.shift? ).should eq( {"foo", "bar"} )
( hash ).should eq( {"baz" => "qux"} )

hash = {} of String => String
( hash.shift? ).should eq( nil )

puts "# hash.cr:842 (051.cr)" # :nocode: :example:
hash = {"foo" => "bar", "baz" => "qux"}
( hash.shift { true } ).should eq( {"foo", "bar"} )
( hash ).should eq( {"baz" => "qux"} )

hash = {} of String => String
( hash.shift { true } ).should eq( true )
( hash ).to_s.should eq( "{}" )

puts "# hash.cr:863 (052.cr)" # :nocode: :example:
hash = {"foo" => "bar"}
( hash.clear ).to_s.should eq( "{}" )

puts "# hash.cr:905 (053.cr)" # :nocode: :example:
hash_a = {"foo" => "bar"}
hash_b = hash_a.dup
hash_b.merge!({"baz" => "qux"})
( hash_a ).should eq( {"foo" => "bar"} )

puts "# hash.cr:921 (054.cr)" # :nocode: :example:
hash_a = {"foobar" => {"foo" => "bar"}}
hash_b = hash_a.clone
hash_b["foobar"]["foo"] = "baz"
( hash_a ).should eq( {"foobar" => {"foo" => "bar"}} )

puts "# hash.cr:941 (055.cr)" # :nocode: :example:
h = {"foo" => "bar"}
( h.to_s ).to_s.should eq( "{\"foo\" => \"bar\"}" )
( h.to_s.class ).should eq( String )

puts "# hash.cr:999 (056.cr)" # :nocode: :example:
( {"foo" => "bar"}.invert ).should eq( {"bar" => "foo"} )
( {"foo" => "bar", "baz" => "bar"}.invert ).should eq( {"bar" => "baz"} )


end
