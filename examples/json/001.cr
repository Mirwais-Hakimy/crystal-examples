# json.cr:15
require "json"

value = JSON.parse("[1, 2, 3]") # : JSON::Any

value[0]              # => 1
typeof(value[0])      # => JSON::Any
value[0].as_i         # => 1
typeof(value[0].as_i) # => Int32

# value[0] + 1       # Error, because value[0] is JSON::Any
value[0].as_i + 10 # => 11
