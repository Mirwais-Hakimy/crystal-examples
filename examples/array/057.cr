# array.cr:1326
a = [1]
a.pop { "Testing" } # => 1
a.pop { "Testing" } # => "Testing"
