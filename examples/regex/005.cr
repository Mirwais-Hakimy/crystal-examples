# regex.cr:54
/stack/ =~ "haystack"  # => 3
"haystack" =~ /stack/  # => 3
$~                     # => #<Regex::MatchData "stack">
/needle/ =~ "haystack" # => nil
"haystack" =~ /needle/ # => nil
$~                     # raises Exception
