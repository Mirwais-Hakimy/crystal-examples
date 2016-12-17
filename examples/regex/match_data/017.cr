# regex/match_data.cr:232
require "regex/match_data"
"Crystal".match(/yst/).not_nil!.post_match # => "al"
