# string.cr:2652
"Hello, World".rindex('o')    # => 8
"Hello, World".rindex('Z')    # => nil
"Hello, World".rindex("o", 5) # => 4
"Hello, World".rindex("W", 2) # => nil
