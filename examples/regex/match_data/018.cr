# regex/match_data.cr:243
require "regex/match_data"
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.captures # => ["Cr", "st"]

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(stal)?/).not_nil!
match.captures # => ["Cr", nil]
