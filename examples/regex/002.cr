# regex.cr:20
x = "a"
/#{x}/.match("asdf") # => #<Regex::MatchData "a">
x = "("
# /#{x}/ # raises ArgumentError
