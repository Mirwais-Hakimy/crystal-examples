# string.cr:1992
"hello".gsub { |char| char + 1 } # => "ifmmp"
"hello".gsub { "hi" }            # => "hihihihihi"
