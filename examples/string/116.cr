# string.cr:3572
"abcd".succ      # => "abce"
"THX1138".succ   # => "THX1139"
"((koala))".succ # => "((koalb))"
"1999zzz".succ   # => "2000aaa"
"ZZZ9999".succ   # => "AAAA0000"
"***".succ       # => "**+"
