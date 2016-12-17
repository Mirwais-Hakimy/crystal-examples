# string.cr:3078
ary = [] of String

"foo,,bar,baz".split(',') { |string| ary << string }
ary # => ["foo", "", "bar", "baz"]
ary.clear

"foo,,bar,baz".split(',', remove_empty: true) { |string| ary << string }
ary # => ["foo", "bar", "baz"]
ary.clear

"foo,bar,baz".split(',', 2) { |string| ary << string }
ary # => ["foo", "bar,baz"]
