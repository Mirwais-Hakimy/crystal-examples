# array.cr:653
a = ["ant", "bat", "cat", "dog"]
a.delete_at(1, 2)  # => ["bat", "cat"]
a                  # => ["ant", "dog"]
# a.delete_at(99, 1) # raises IndexError
