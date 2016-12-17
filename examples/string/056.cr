# string.cr:1638
"hello".sub { |char| char + 1 } # => "iello"
"hello".sub { "hi" }            # => "hiello"
