# json/serialization.cr:68
require "json"
struct A
  include JSON::Serializable
  @a : Int32
  @b : Float64 = 1.0
end

A.from_json(%<{"a":1}>) # => A(@a=1, @b=1.0)
