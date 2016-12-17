# regex/match_data.cr:265
require "regex/match_data"
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.named_captures # => {"name1" => "y", "name2" => "al"}

# When this regex has an optional group, result hash may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(?<name1>Cr)(?<name2>stal)?/).not_nil!
match.named_captures # => {"name1" => "Cr", "name2" => nil}
