# string.cr:2080
"foo".gsub(/o/, "x\\0x")                  # => "fxoxxox"
"foofoo".gsub(/(?<bar>oo)/, "|\\k<bar>|") # => "f|oo|f|oo|"
"foo".gsub(/o/, "\\\\0")                  # => "f\\0\\0"
