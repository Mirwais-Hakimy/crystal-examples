# array.cr:1571
a = ["a", "b"]
a.shift? # => "a"
a        # => ["b"]
a.shift? # => "b"
a        # => []
a.shift? # => nil
a        # => []
