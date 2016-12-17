# regex/match_data.cr:48
require "regex/match_data"
"Crystal".match(/[p-s]/).not_nil!.size          # => 1
"Crystal".match(/r(ys)/).not_nil!.size          # => 2
"Crystal".match(/r(ys)(?<ok>ta)/).not_nil!.size # => 3
