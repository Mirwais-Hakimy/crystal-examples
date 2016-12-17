# regex/match_data.cr:28
require "regex/match_data"
"Crystal".match(/[p-s]/).not_nil!.group_size          # => 0
"Crystal".match(/r(ys)/).not_nil!.group_size          # => 1
"Crystal".match(/r(ys)(?<ok>ta)/).not_nil!.group_size # => 2
