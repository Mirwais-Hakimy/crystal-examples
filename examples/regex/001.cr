# regex.cr:10
/hay/ =~ "haystack"   # => 0
/y/.match("haystack") # => #<Regex::MatchData "y">
