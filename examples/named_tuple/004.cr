# named_tuple.cr:62
require "json"

def speak_about(thing : String, n : Int64)
  "I see #{n} #{thing}s"
end

hash = JSON.parse(%({"thing": "world", "n": 2})).as_h # hash : Hash(String, JSON::Any)
hash = hash.transform_values(&.raw)                   # hash : Hash(String, JSON::Any::Type)

speak_about(**{thing: String, n: Int64}.from(hash)) # => "I see 2 worlds"
