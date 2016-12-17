# regex.cr:342
re = Regex.union(/skiing/i, "sledding")
re.match("Skiing")   # => #<Regex::MatchData "Skiing">
re.match("sledding") # => #<Regex::MatchData "sledding">
