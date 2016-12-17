# regex/match_data.cr:106
require "regex/match_data"
"Crystal".match(/r/).not_nil!.byte_end(0)     # => 2
"Crystal".match(/r(ys)/).not_nil!.byte_end(1) # => 4
"クリスタル".match(/リ(ス)/).not_nil!.byte_end(0)    # => 9
