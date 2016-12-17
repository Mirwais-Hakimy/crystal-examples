# regex/match_data.cr:76
require "regex/match_data"
"Crystal".match(/r/).not_nil!.end(0)     # => 2
"Crystal".match(/r(ys)/).not_nil!.end(1) # => 4
"クリスタル".match(/リ(ス)/).not_nil!.end(0)    # => 3
