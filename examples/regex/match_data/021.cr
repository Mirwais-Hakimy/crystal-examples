# regex/match_data.cr:304
require "regex/match_data"
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.to_h # => {0 => "Crystal", 1 => "Cr", "name1" => "y", 3 => "st", "name2" => "al"}

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(?<name1>stal)?/).not_nil!
match.to_h # => {0 => "Cr", 1 => "Cr", "name1" => nil}
