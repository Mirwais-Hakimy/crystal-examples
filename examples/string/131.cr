# string.cr:4056
"I have %d apples" % 5                                             # => "I have 5 apples"
"%s, %s, %s, D" % ['A', 'B', 'C']                                  # => "A, B, C, D"
"sum: %{one} + %{two} = %{three}" % {one: 1, two: 2, three: 1 + 2} # => "sum: 1 + 2 = 3"
"I have %<apples>s apples" % {apples: 4}                           # => "I have 4 apples"
