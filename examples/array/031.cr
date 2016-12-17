# array.cr:617
a = ["ant", "bat", "cat", "dog"]
a.delete_at(2)  # => "cat"
a               # => ["ant", "bat", "dog"]
# a.delete_at(99) # raises IndexError
