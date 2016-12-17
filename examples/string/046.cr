# string.cr:1363
"bcadefcba".strip { |c| 'a' <= c <= 'c' } # => "def"
