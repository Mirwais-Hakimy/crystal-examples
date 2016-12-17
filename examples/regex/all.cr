# regex.cr: 30 examples

# regex.cr:10 (001.cr)
/hay/ =~ "haystack"   # => 0
/y/.match("haystack") # => #<Regex::MatchData "y">

# regex.cr:20 (002.cr)
x = "a"
/#{x}/.match("asdf") # => #<Regex::MatchData "a">
x = "("
# /#{x}/ # raises ArgumentError

# regex.cr:35 (003.cr)
/needle/.match("haystack") # => nil

# regex.cr:41 (004.cr)
/hay/.match("haystack") # => #<Regex::MatchData "hay">

# regex.cr:54 (005.cr)
/stack/ =~ "haystack"  # => 3
"haystack" =~ /stack/  # => 3
$~                     # => #<Regex::MatchData "stack">
/needle/ =~ "haystack" # => nil
"haystack" =~ /needle/ # => nil
$~                     # raises Exception

# regex.cr:67 (006.cr)
/hay/.match("haystack")    # => #<Regex::MatchData "hay">
"haystack".match(/hay/)    # => #<Regex::MatchData "hay">
$~                         # => #<Regex::MatchData "hay">
/needle/.match("haystack") # => nil
"haystack".match(/needle/) # => nil
$~                         # raises Exception

# regex.cr:103 (007.cr)
/a(sd)f/.match("_asdf_")                     # => #<Regex::MatchData "asdf" 1:"sd">
/a(sd)f/.match("_asdf_").try &.[1]           # => "sd"
/a(?<grp>sd)f/.match("_asdf_")               # => #<Regex::MatchData "asdf" grp:"sd">
/a(?<grp>sd)f/.match("_asdf_").try &.["grp"] # => "sd"

# regex.cr:119 (008.cr)
/(spice)(s)?/.match("spice") # => #<Regex::MatchData "spice" 1:"spice" 2:nil>
$1                           # => "spice"
$2                           # => raises Exception

# regex.cr:136 (009.cr)
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

# regex.cr:159 (010.cr)
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

# regex.cr:180 (011.cr)
/asdf/ =~ "ASDF"    # => nil
/asdf/i =~ "ASDF"   # => 0
/^z/i =~ "ASDF\nZ"  # => nil
/^z/im =~ "ASDF\nZ" # => 5

# regex.cr:228 (012.cr)
/ab+c/ix.options      # => Regex::Options::IGNORE_CASE | Regex::Options::EXTENDED
/ab+c/ix.options.to_s # => "IGNORE_CASE | EXTENDED"

# regex.cr:236 (013.cr)
/ab+c/x.source # => "ab+c"

# regex.cr:243 (014.cr)
Regex.new("^a-z+:\\s+\\w+")                   # => /^a-z+:\s+\w+/
Regex.new("cat", Regex::Options::IGNORE_CASE) # => /cat/i
options = Regex::Options::IGNORE_CASE | Regex::Options::EXTENDED
Regex.new("dog", options) # => /dog/ix

# regex.cr:264 (015.cr)
Regex.error?("(foo|bar)") # => nil
Regex.error?("(foo|bar")  # => "missing ) at 8"

# regex.cr:279 (016.cr)
Regex.needs_escape?('*') # => true
Regex.needs_escape?('@') # => false

# regex.cr:289 (017.cr)
Regex.needs_escape?("10$") # => true
Regex.needs_escape?("foo") # => false

# regex.cr:300 (018.cr)
string = Regex.escape("\*?{}.") # => "\\*\\?\\{\\}\\."
/#{string}/                     # => /\*\?\{\}\./

# regex.cr:325 (019.cr)
re = Regex.union([/skiing/i, "sledding"])
re.match("Skiing")   # => #<Regex::MatchData "Skiing">
re.match("sledding") # => #<Regex::MatchData "sledding">
re = Regex.union({/skiing/i, "sledding"})
re.match("Skiing")   # => #<Regex::MatchData "Skiing">
re.match("sledding") # => #<Regex::MatchData "sledding">

# regex.cr:342 (020.cr)
re = Regex.union(/skiing/i, "sledding")
re.match("Skiing")   # => #<Regex::MatchData "Skiing">
re.match("sledding") # => #<Regex::MatchData "sledding">

# regex.cr:364 (021.cr)
re = /skiing/i + /sledding/
re.match("Skiing")   # => #<Regex::MatchData "Skiing">
re.match("sledding") # => #<Regex::MatchData "sledding">

# regex.cr:375 (022.cr)
/abc/ == /abc/i  # => false
/abc/i == /ABC/i # => false
/abc/i == /abc/i # => true

# regex.cr:388 (023.cr)
a = "HELLO"
b = case a
    when /^[a-z]*$/
      "Lower case"
    when /^[A-Z]*$/
      "Upper case"
    else
      "Mixed case"
    end
b # => "Upper case"

# regex.cr:411 (024.cr)
/at/ =~ "input data" # => 7
/ax/ =~ "input data" # => nil

# regex.cr:423 (025.cr)
/at/ =~ "input data" # => 7
/ax/ =~ "input data" # => nil

# regex.cr:435 (026.cr)
/ab+c/ix.inspect # => "/ab+c/ix"

# regex.cr:452 (027.cr)
/(.)(.)(.)/.match("abc").try &.[2]   # => "b"
/(.)(.)/.match("abc", 1).try &.[2]   # => "c"
/(.)(.)/.match("クリスタル", 3).try &.[2] # => "ル"

# regex.cr:472 (028.cr)
/(.)(.)(.)/.match_at_byte_index("abc").try &.[2]   # => "b"
/(.)(.)/.match_at_byte_index("abc", 1).try &.[2]   # => "c"
/(.)(.)/.match_at_byte_index("クリスタル", 3).try &.[2] # => "ス"

# regex.cr:496 (029.cr)
/(.)/.name_table                         # => {}
/(?<foo>.)/.name_table                   # => {1 => "foo"}
/(?<foo>.)(?<bar>.)/.name_table          # => {2 => "bar", 1 => "foo"}
/(.)(?<foo>.)(.)(?<bar>.)(.)/.name_table # => {4 => "bar", 2 => "foo"}

# regex.cr:528 (030.cr)
re = /A*/i                 # => /A*/i
re.to_s                    # => "(?i-msx:A*)"
"Crystal".match(/t#{re}l/) # => #<Regex::MatchData "tal">
re = /A*/                  # => "(?-imsx:A*)"
"Crystal".match(/t#{re}l/) # => nil
