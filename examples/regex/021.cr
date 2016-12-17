# regex.cr:364
re = /skiing/i + /sledding/
re.match("Skiing")   # => #<Regex::MatchData "Skiing">
re.match("sledding") # => #<Regex::MatchData "sledding">
