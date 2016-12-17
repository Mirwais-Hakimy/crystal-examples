# json/from_json.cr:7
require "json"
Int32.from_json("1")                # => 1
Array(Int32).from_json("[1, 2, 3]") # => [1, 2, 3]
