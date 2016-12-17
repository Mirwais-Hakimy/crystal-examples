# string.cr:1476
"bcadefcba".lstrip { |c| 'a' <= c <= 'c' } # => "defcba"
