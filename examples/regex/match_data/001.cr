# regex/match_data.cr:6
require "regex/match_data"
if md = "Crystal".match(/[p-s]/)
  md.string # => "Crystal"
  md[0]     # => "r"
  md[1]?    # => nil
end
