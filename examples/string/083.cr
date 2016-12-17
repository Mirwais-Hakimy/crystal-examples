# string.cr:2255
"aabbcc".delete { |c| ['a', 'b'].includes?(c) } # => "cc"
