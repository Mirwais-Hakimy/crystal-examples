# regex/match_data.cr: 21 examples
require "regex/match_data"

# regex/match_data.cr:6 (001.cr)
if md = "Crystal".match(/[p-s]/)
  md.string # => "Crystal"
  md[0]     # => "r"
  md[1]?    # => nil
end

# regex/match_data.cr:21 (002.cr)
"Crystal".match(/[p-s]/).not_nil!.regex # => /[p-s]/

# regex/match_data.cr:28 (003.cr)
"Crystal".match(/[p-s]/).not_nil!.group_size          # => 0
"Crystal".match(/r(ys)/).not_nil!.group_size          # => 1
"Crystal".match(/r(ys)(?<ok>ta)/).not_nil!.group_size # => 2

# regex/match_data.cr:37 (004.cr)
"Crystal".match(/[p-s]/).not_nil!.string # => "Crystal"

# regex/match_data.cr:48 (005.cr)
"Crystal".match(/[p-s]/).not_nil!.size          # => 1
"Crystal".match(/r(ys)/).not_nil!.size          # => 2
"Crystal".match(/r(ys)(?<ok>ta)/).not_nil!.size # => 3

# regex/match_data.cr:62 (006.cr)
"Crystal".match(/r/).not_nil!.begin(0)     # => 1
"Crystal".match(/r(ys)/).not_nil!.begin(1) # => 2
"クリスタル".match(/リ(ス)/).not_nil!.begin(0)    # => 1

# regex/match_data.cr:76 (007.cr)
"Crystal".match(/r/).not_nil!.end(0)     # => 2
"Crystal".match(/r(ys)/).not_nil!.end(1) # => 4
"クリスタル".match(/リ(ス)/).not_nil!.end(0)    # => 3

# regex/match_data.cr:90 (008.cr)
"Crystal".match(/r/).not_nil!.byte_begin(0)     # => 1
"Crystal".match(/r(ys)/).not_nil!.byte_begin(1) # => 2
"クリスタル".match(/リ(ス)/).not_nil!.byte_begin(0)    # => 3

# regex/match_data.cr:106 (009.cr)
"Crystal".match(/r/).not_nil!.byte_end(0)     # => 2
"Crystal".match(/r(ys)/).not_nil!.byte_end(1) # => 4
"クリスタル".match(/リ(ス)/).not_nil!.byte_end(0)    # => 9

# regex/match_data.cr:122 (010.cr)
"Crystal".match(/r(ys)/).not_nil![0]? # => "rys"
"Crystal".match(/r(ys)/).not_nil![1]? # => "ys"
"Crystal".match(/r(ys)/).not_nil![2]? # => nil

# regex/match_data.cr:140 (011.cr)
"Crystal".match(/r(ys)/).not_nil![1] # => "ys"
# "Crystal".match(/r(ys)/).not_nil![2] # raises IndexError

# regex/match_data.cr:156 (012.cr)
"Crystal".match(/r(?<ok>ys)/).not_nil!["ok"]? # => "ys"
"Crystal".match(/r(?<ok>ys)/).not_nil!["ng"]? # => nil

# regex/match_data.cr:164 (013.cr)
"Crystal".match(/(?<ok>Cr).*(?<ok>al)/).not_nil!["ok"]? # => "al"

# regex/match_data.cr:183 (014.cr)
"Crystal".match(/r(?<ok>ys)/).not_nil!["ok"] # => "ys"
# "Crystal".match(/r(?<ok>ys)/).not_nil!["ng"] # raises KeyError

# regex/match_data.cr:191 (015.cr)
"Crystal".match(/(?<ok>Cr).*(?<ok>al)/).not_nil!["ok"] # => "al"

# regex/match_data.cr:222 (016.cr)
"Crystal".match(/yst/).not_nil!.pre_match # => "Cr"

# regex/match_data.cr:232 (017.cr)
"Crystal".match(/yst/).not_nil!.post_match # => "al"

# regex/match_data.cr:243 (018.cr)
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.captures # => ["Cr", "st"]

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(stal)?/).not_nil!
match.captures # => ["Cr", nil]

# regex/match_data.cr:265 (019.cr)
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.named_captures # => {"name1" => "y", "name2" => "al"}

# When this regex has an optional group, result hash may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(?<name1>Cr)(?<name2>stal)?/).not_nil!
match.named_captures # => {"name1" => "Cr", "name2" => nil}

# regex/match_data.cr:289 (020.cr)
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.to_a # => ["Crystal", "Cr", "y", "st", "al"]

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(?<name1>stal)?/).not_nil!
match.to_a # => ["Cr", "Cr", nil]

# regex/match_data.cr:304 (021.cr)
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
match.to_h # => {0 => "Crystal", 1 => "Cr", "name1" => "y", 3 => "st", "name2" => "al"}

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(?<name1>stal)?/).not_nil!
match.to_h # => {0 => "Cr", 1 => "Cr", "name1" => nil}
