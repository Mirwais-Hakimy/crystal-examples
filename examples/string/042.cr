# string.cr:1267
"abcd".insert(0, "FOO")  # => "FOOabcd"
"abcd".insert(3, "FOO")  # => "abcFOOd"
"abcd".insert(4, "FOO")  # => "abcdFOO"
"abcd".insert(-3, "FOO") # => "abFOOcd"
"abcd".insert(-1, "FOO") # => "abcdFOO"

# "abcd".insert(5, "FOO")  # raises IndexError
# "abcd".insert(-6, "FOO") # raises IndexError
