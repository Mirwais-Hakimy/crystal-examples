# regex.cr:136
/fo*/.match("_f_")         # => #<Regex::MatchData "f">
/fo+/.match("_f_")         # => nil
/fo*/.match("_foo_")       # => #<Regex::MatchData "foo">
/fo{3,}/.match("_foo_")    # => nil
/fo{1,3}/.match("_foo_")   # => #<Regex::MatchData "foo">
/fo*/.match("_foo_")       # => #<Regex::MatchData "foo">
/fo*/.match("_foooooooo_") # => #<Regex::MatchData "foooooooo">
/fo{,3}/.match("_foooo_")  # => nil
/f(op)*/.match("fopopo")   # => #<Regex::MatchData "fopop" 1: "op">
/foo?bar/.match("foobar")  # => #<Regex::MatchData "foobar">
/foo?bar/.match("fobar")   # => #<Regex::MatchData "fobar">
