# string.cr:1422
"bcadefcba".rstrip { |c| 'a' <= c <= 'c' } # => "bcadef"
