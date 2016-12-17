# regex/match_data.cr:191
require "regex/match_data"
"Crystal".match(/(?<ok>Cr).*(?<ok>al)/).not_nil!["ok"] # => "al"
