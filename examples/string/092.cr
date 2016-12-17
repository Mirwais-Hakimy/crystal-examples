# string.cr:2396
"abcdef".compare("abcde")   # => 1
"abcdef".compare("abcdef")  # => 0
"abcdef".compare("abcdefg") # => -1
"abcdef".compare("ABCDEF")  # => 1

"abcdef".compare("ABCDEF", case_insensitive: true) # => 0
"abcdef".compare("ABCDEG", case_insensitive: true) # => -1
