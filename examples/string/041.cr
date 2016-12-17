# string.cr:1236
"abcd".insert(0, 'X')  # => "Xabcd"
"abcd".insert(3, 'X')  # => "abcXd"
"abcd".insert(4, 'X')  # => "abcdX"
"abcd".insert(-3, 'X') # => "abXcd"
"abcd".insert(-1, 'X') # => "abcdX"

# "abcd".insert(5, 'X')  # raises IndexError
# "abcd".insert(-6, 'X') # raises IndexError
