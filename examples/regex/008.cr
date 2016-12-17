# regex.cr:119
/(spice)(s)?/.match("spice") # => #<Regex::MatchData "spice" 1:"spice" 2:nil>
$1                           # => "spice"
$2                           # => raises Exception
