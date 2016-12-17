# regex/match_data.cr:37
require "regex/match_data"
"Crystal".match(/[p-s]/).not_nil!.string # => "Crystal"
