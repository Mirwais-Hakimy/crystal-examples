# regex.cr:67
/hay/.match("haystack")    # => #<Regex::MatchData "hay">
"haystack".match(/hay/)    # => #<Regex::MatchData "hay">
$~                         # => #<Regex::MatchData "hay">
/needle/.match("haystack") # => nil
"haystack".match(/needle/) # => nil
$~                         # raises Exception
