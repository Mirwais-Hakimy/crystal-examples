# regex/match_data.cr:122
require "regex/match_data"
"Crystal".match(/r(ys)/).not_nil![0]? # => "rys"
"Crystal".match(/r(ys)/).not_nil![1]? # => "ys"
"Crystal".match(/r(ys)/).not_nil![2]? # => nil
