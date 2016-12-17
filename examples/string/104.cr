# string.cr:3058
"foo,,bar,baz".split(',')                     # => ["foo", "", "bar", "baz"]
"foo,,bar,baz".split(',', remove_empty: true) # => ["foo", "bar", "baz"]
"foo,bar,baz".split(',', 2)                   # => ["foo", "bar,baz"]
