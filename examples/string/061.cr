# string.cr:1721
"foo".sub(/o/, "x\\0x")                  # => "fxoxo"
"foofoo".sub(/(?<bar>oo)/, "|\\k<bar>|") # => "f|oo|foo"
"foo".sub(/o/, "\\\\0")                  # => "f\\0o"
