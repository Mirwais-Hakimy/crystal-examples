# regex/match_data.cr:140
require "regex/match_data"
"Crystal".match(/r(ys)/).not_nil![1] # => "ys"
# "Crystal".match(/r(ys)/).not_nil![2] # raises IndexError
