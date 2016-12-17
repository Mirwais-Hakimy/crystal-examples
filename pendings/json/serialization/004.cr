# json/serialization.cr:86
require "json"
struct A
  include JSON::Serializable
  include JSON::Serializable::Unmapped
  @a : Int32
end

a = A.from_json(%({"a":1,"b":2})) # => A(@json_unmapped={"b" => 2_i64}, @a=1)
a.to_json                         # => {"a":1,"b":2}
