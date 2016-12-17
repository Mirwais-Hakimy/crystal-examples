# regex.cr:103
/a(sd)f/.match("_asdf_")                     # => #<Regex::MatchData "asdf" 1:"sd">
/a(sd)f/.match("_asdf_").try &.[1]           # => "sd"
/a(?<grp>sd)f/.match("_asdf_")               # => #<Regex::MatchData "asdf" grp:"sd">
/a(?<grp>sd)f/.match("_asdf_").try &.["grp"] # => "sd"
