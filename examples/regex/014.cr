# regex.cr:243
Regex.new("^a-z+:\\s+\\w+")                   # => /^a-z+:\s+\w+/
Regex.new("cat", Regex::Options::IGNORE_CASE) # => /cat/i
options = Regex::Options::IGNORE_CASE | Regex::Options::EXTENDED
Regex.new("dog", options) # => /dog/ix
