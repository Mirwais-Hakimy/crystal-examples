# regex/match_data.cr:222
require "regex/match_data"
"Crystal".match(/yst/).not_nil!.pre_match # => "Cr"
