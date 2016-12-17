# regex/match_data.cr:62
require "regex/match_data"
"Crystal".match(/r/).not_nil!.begin(0)     # => 1
"Crystal".match(/r(ys)/).not_nil!.begin(1) # => 2
"クリスタル".match(/リ(ス)/).not_nil!.begin(0)    # => 1
