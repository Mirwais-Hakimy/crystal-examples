# string.cr:2291
"aaabbbccc".squeeze { |c| ['a', 'b'].includes?(c) } # => "abccc"
"aaabbbccc".squeeze { |c| ['a', 'c'].includes?(c) } # => "abbbc"
