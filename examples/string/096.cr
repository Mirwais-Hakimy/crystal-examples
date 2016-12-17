# string.cr:2543
"Hello, World".index('o')    # => 4
"Hello, World".index('Z')    # => nil
"Hello, World".index("o", 5) # => 8
"Hello, World".index("H", 2) # => nil
"Hello, World".index(/[ ]+/) # => 6
"Hello, World".index(/\d+/)  # => nil
