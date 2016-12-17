# json/from_json.cr:21
require "json"
Int32.from_json(%({"main": 1}), root: "main") # => 1
