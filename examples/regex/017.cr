# regex.cr:289
Regex.needs_escape?("10$") # => true
Regex.needs_escape?("foo") # => false
