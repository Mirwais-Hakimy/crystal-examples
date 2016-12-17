# regex/match_data.cr:156
require "regex/match_data"
"Crystal".match(/r(?<ok>ys)/).not_nil!["ok"]? # => "ys"
"Crystal".match(/r(?<ok>ys)/).not_nil!["ng"]? # => nil
