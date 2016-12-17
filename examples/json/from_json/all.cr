# json/from_json.cr: 3 examples
require "json"

# json/from_json.cr:7 (001.cr)
Int32.from_json("1")                # => 1
Array(Int32).from_json("[1, 2, 3]") # => [1, 2, 3]

# json/from_json.cr:21 (002.cr)
Int32.from_json(%({"main": 1}), root: "main") # => 1

# json/from_json.cr:36 (003.cr)
require "json"

Array(Int32).from_json("[1, 2, 3]") do |element|
  puts element
end
