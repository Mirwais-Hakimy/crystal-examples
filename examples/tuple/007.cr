# tuple.cr:103
def speak_about(thing : String, n : Int64)
  "I see #{n} #{thing}s"
end

data = JSON.parse(%(["world", 2])).as_a
speak_about(*{String, Int64}.from(data)) # => "I see 2 worlds"
