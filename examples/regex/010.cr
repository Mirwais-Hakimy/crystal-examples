# regex.cr:159
/foo|bar/.match("foo")     # => #<Regex::MatchData "foo">
/foo|bar/.match("bar")     # => #<Regex::MatchData "bar">
/_(x|y)_/.match("_x_")     # => #<Regex::MatchData "_x_" 1: "x">
/_(x|y)_/.match("_y_")     # => #<Regex::MatchData "_y_" 1: "y">
/_(x|y)_/.match("_(x|y)_") # => nil
/_(x|y)_/.match("_(x|y)_") # => nil
/_._/.match("_x_")         # => #<Regex::MatchData "_x_">
/_[xyz]_/.match("_x_")     # => #<Regex::MatchData "_x_">
/_[a-z]_/.match("_x_")     # => #<Regex::MatchData "_x_">
/_[^a-z]_/.match("_x_")    # => nil
/_[^a-wy-z]_/.match("_x_") # => #<Regex::MatchData "_x_">
