# string.cr:2224
"aabbcc".count { |c| ['a', 'b'].includes?(c) } # => 4
