# regex/match_data.cr:90
require "regex/match_data"
"Crystal".match(/r/).not_nil!.byte_begin(0)     # => 1
"Crystal".match(/r(ys)/).not_nil!.byte_begin(1) # => 2
"クリスタル".match(/リ(ス)/).not_nil!.byte_begin(0)    # => 3
