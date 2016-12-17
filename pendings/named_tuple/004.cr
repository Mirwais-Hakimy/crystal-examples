# named_tuple.cr:62
require "json"

def speak_about(thing : String, n : Int64)
  "I see #{n} #{thing}s"
end

data = JSON.parse(%({"thing": "world", "n": 2})).as_h
speak_about(**{thing: String, n: Int64}.from(data)) # => "I see 2 worlds"
