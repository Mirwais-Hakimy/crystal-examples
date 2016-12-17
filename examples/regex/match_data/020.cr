# regex/match_data.cr:289
require "regex/match_data"
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.to_a # => ["Crystal", "Cr", "y", "st", "al"]

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(?<name1>stal)?/).not_nil!
match.to_a # => ["Cr", "Cr", nil]
