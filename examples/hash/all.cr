# hash.cr: 56 examples

# hash.cr:18 (001.cr)
proc = ->(hash : Hash(String, Int32), key : String) { hash[key] = key.size }
hash = Hash(String, Int32).new(proc)

hash.size   # => 0
hash["foo"] # => 3
hash.size   # => 1
hash["bar"] = 10
hash["bar"] # => 10

# hash.cr:46 (002.cr)
hash = Hash(String, Int32).new do |hash, key|
  hash[key] = key.size
end

hash.size   # => 0
hash["foo"] # => 3
hash.size   # => 1
hash["bar"] = 10
hash["bar"] # => 10

# hash.cr:69 (003.cr)
inventory = Hash(String, Int32).new(0)
inventory["socks"] = 3
inventory["pickles"] # => 0

# hash.cr:76 (004.cr)
arr = [1, 2, 3]
hash = Hash(String, Array(Int32)).new(arr)
hash["3"][1] = 4
arr # => [1, 4, 3]

# hash.cr:94 (005.cr)
h = {} of String => String
h["foo"] = "bar"
h["foo"] # => "bar"

# hash.cr:121 (006.cr)
h = {"foo" => "bar"}
h["foo"] # => "bar"

h = Hash(String, String).new("bar")
h["foo"] # => "bar"

h = Hash(String, String).new { "bar" }
h["foo"] # => "bar"

h = Hash(String, String).new
# h["foo"] # raises KeyError

# hash.cr:147 (007.cr)
h = {"foo" => "bar"}
h["foo"]? # => "bar"
h["bar"]? # => nil

h = Hash(String, String).new("bar")
h["foo"]? # => nil

# hash.cr:162 (008.cr)
h = {"a" => {"b" => [10, 20, 30]}}
h.dig? "a", "b"                # => [10, 20, 30]
h.dig? "a", "b", "c", "d", "e" # => nil

# hash.cr:181 (009.cr)
h = {"a" => {"b" => [10, 20, 30]}}
h.dig "a", "b"                # => [10, 20, 30]
# h.dig "a", "b", "c", "d", "e" # raises KeyError

# hash.cr:200 (010.cr)
h = {"foo" => "bar"}
h.has_key?("foo") # => true
h.has_key?("bar") # => false

# hash.cr:211 (011.cr)
h = {"foo" => "bar"}
h.has_value?("foo") # => false
h.has_value?("bar") # => true

# hash.cr:226 (012.cr)
h = {"foo" => "bar"}
h.fetch("foo", "foo") # => "bar"
h.fetch("bar", "foo") # => "foo"

# hash.cr:237 (013.cr)
h = {"foo" => "bar"}
h.fetch("foo") { "default value" }  # => "bar"
h.fetch("bar") { "default value" }  # => "default value"
h.fetch("bar") { |key| key.upcase } # => "BAR"

# hash.cr:251 (014.cr)
{"a" => 1, "b" => 2, "c" => 3, "d" => 4}.values_at("a", "c") # => {1, 3}

# hash.cr:260 (015.cr)
hash = {"foo" => "bar", "baz" => "qux"}
hash.key_for("bar")    # => "foo"
hash.key_for("qux")    # => "baz"
# hash.key_for("foobar") # raises KeyError (Missing hash key for value: foobar)

# hash.cr:272 (016.cr)
hash = {"foo" => "bar", "baz" => "qux"}
hash.key_for?("bar")    # => "foo"
hash.key_for?("qux")    # => "baz"
hash.key_for?("foobar") # => nil

# hash.cr:284 (017.cr)
hash = {"foo" => "bar"}
hash.key_for("bar") { |value| value.upcase } # => "foo"
hash.key_for("qux") { |value| value.upcase } # => "QUX"

# hash.cr:298 (018.cr)
h = {"foo" => "bar"}
h.delete("foo")     # => "bar"
h.fetch("foo", nil) # => nil

# hash.cr:309 (019.cr)
h = {"foo" => "bar"}
h.delete("foo") { |key| "#{key} not found" } # => "bar"
h.fetch("foo", nil)                          # => nil
h.delete("baz") { |key| "#{key} not found" } # => "baz not found"

# hash.cr:357 (020.cr)
h = {"foo" => "bar", "fob" => "baz", "bar" => "qux"}
h.delete_if { |key, value| key.starts_with?("fo") }
h # => { "bar" => "qux" }

# hash.cr:375 (021.cr)
h = Hash(String, String).new
h.empty? # => true

h = {"foo" => "bar"}
h.empty? # => false

# hash.cr:388 (022.cr)
h = {"foo" => "bar"}

h.each do |key, value|
  key   # => "foo"
  value # => "bar"
end

h.each do |key_and_value|
  key_and_value # => {"foo", "bar"}
end

# hash.cr:411 (023.cr)
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each

iterator.next # => {"foo", "bar"}
iterator.next # => {"baz", "qux"}

# hash.cr:424 (024.cr)
h = {"foo" => "bar"}
h.each_key do |key|
  key # => "foo"
end

# hash.cr:439 (025.cr)
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each_key

key = iterator.next
key # => "foo"

key = iterator.next
key # => "baz"

# hash.cr:455 (026.cr)
h = {"foo" => "bar"}
h.each_value do |value|
  value # => "bar"
end

# hash.cr:470 (027.cr)
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each_value

value = iterator.next
value # => "bar"

value = iterator.next
value # => "qux"

# hash.cr:486 (028.cr)
h = {"foo" => "bar", "baz" => "bar"}
h.keys # => ["foo", "baz"]

# hash.cr:498 (029.cr)
h = {"foo" => "bar", "baz" => "qux"}
h.values # => ["bar", "qux"]

# hash.cr:511 (030.cr)
h = {"foo" => "bar", "baz" => "qux"}
h.key_index("foo") # => 0
h.key_index("qux") # => nil

# hash.cr:526 (031.cr)
hash = {"foo" => "bar"}
hash.merge({"baz" => "qux"})
# => {"foo" => "bar", "baz" => "qux"}
hash
# => {"foo" => "bar"}

# hash.cr:549 (032.cr)
hash = {"foo" => "bar"}
hash.merge!({"baz" => "qux"})
hash # => {"foo" => "bar", "baz" => "qux"}

# hash.cr:573 (033.cr)
h = {"a" => 100, "b" => 200, "c" => 300}
h.select { |k, v| k > "a" } # => {"b" => 200, "c" => 300}
h.select { |k, v| v < 200 } # => {"a" => 100}

# hash.cr:588 (034.cr)
h = {"a" => 100, "b" => 200, "c" => 300}
h.reject { |k, v| k > "a" } # => {"a" => 100}
h.reject { |k, v| v < 200 } # => {"b" => 200, "c" => 300}

# hash.cr:610 (035.cr)
{"a" => 1, "b" => 2, "c" => 3, "d" => 4}.reject("a", "c") # => {"b" => 2, "d" => 4}

# hash.cr:620 (036.cr)
h = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.reject!("a", "c")
h # => {"b" => 2, "d" => 4}

# hash.cr:635 (037.cr)
{"a" => 1, "b" => 2, "c" => 3, "d" => 4}.select("a", "c") # => {"a" => 1, "c" => 3}

# hash.cr:650 (038.cr)
h = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.select!("a", "c")
h # => {"a" => 1, "c" => 3}

# hash.cr:665 (039.cr)
hash = {"hello" => "world", "foo" => nil}
hash.compact # => {"hello" => "world"}

# hash.cr:677 (040.cr)
hash = {"hello" => "world", "foo" => nil}
hash.compact! # => {"hello" => "world"}
hash.compact! # => nil

# hash.cr:689 (041.cr)
hash = {:a => 1, :b => 2, :c => 3}
hash.transform_keys { |key| key.to_s } # => {"A" => 1, "B" => 2, "C" => 3}

# hash.cr:702 (042.cr)
hash = {:a => 1, :b => 2, :c => 3}
hash.transform_values { |value| value + 1 } # => {:a => 2, :b => 3, :c => 4}

# hash.cr:715 (043.cr)
hash = {:a => 1, :b => 2, :c => 3}
hash.transform_values! { |value| value + 1 }
hash # => {:a => 2, :b => 3, :c => 4}

# hash.cr:730 (044.cr)
Hash.zip(["key1", "key2", "key3"], ["value1", "value2", "value3"])
# => {"key1" => "value1", "key2" => "value2", "key3" => "value3"}

# hash.cr:749 (045.cr)
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.first_key? # => "foo1"
hash.clear
hash.first_key? # => nil

# hash.cr:766 (046.cr)
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.first_value? # => "bar1"
hash.clear
hash.first_value? # => nil

# hash.cr:783 (047.cr)
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.last_key? # => "foz2"
hash.clear
hash.last_key? # => nil

# hash.cr:800 (048.cr)
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.last_value? # => "baz2"
hash.clear
hash.last_value? # => nil

# hash.cr:813 (049.cr)
hash = {"foo" => "bar", "baz" => "qux"}
hash.shift # => {"foo", "bar"}
hash       # => {"baz" => "qux"}

hash = {} of String => String
# hash.shift # raises IndexError

# hash.cr:827 (050.cr)
hash = {"foo" => "bar", "baz" => "qux"}
hash.shift? # => {"foo", "bar"}
hash        # => {"baz" => "qux"}

hash = {} of String => String
hash.shift? # => nil

# hash.cr:842 (051.cr)
hash = {"foo" => "bar", "baz" => "qux"}
hash.shift { true } # => {"foo", "bar"}
hash                # => {"baz" => "qux"}

hash = {} of String => String
hash.shift { true } # => true
hash                # => {}

# hash.cr:863 (052.cr)
hash = {"foo" => "bar"}
hash.clear # => {}

# hash.cr:905 (053.cr)
hash_a = {"foo" => "bar"}
hash_b = hash_a.dup
hash_b.merge!({"baz" => "qux"})
hash_a # => {"foo" => "bar"}

# hash.cr:921 (054.cr)
hash_a = {"foobar" => {"foo" => "bar"}}
hash_b = hash_a.clone
hash_b["foobar"]["foo"] = "baz"
hash_a # => {"foobar" => {"foo" => "bar"}}

# hash.cr:941 (055.cr)
h = {"foo" => "bar"}
h.to_s       # => "{\"foo\" => \"bar\"}"
h.to_s.class # => String

# hash.cr:999 (056.cr)
{"foo" => "bar"}.invert                 # => {"bar" => "foo"}
{"foo" => "bar", "baz" => "bar"}.invert # => {"bar" => "baz"}
