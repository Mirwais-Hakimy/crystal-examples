require "spec"

it "regex.cr" do
puts # :nocode:

puts "# regex.cr:10 (001.cr)" # :nocode: :example:
( /hay/ =~ "haystack" ).should eq( 0 )
( /y/.match("haystack") ).class.to_s.should eq( "Regex::MatchData" )

puts "# regex.cr:20 (002.cr)" # :nocode: :example:
x = "a"
( /#{x}/.match("asdf") ).class.to_s.should eq( "Regex::MatchData" )
x = "("
expect_raises(ArgumentError) { /#{x}/ }

puts "# regex.cr:35 (003.cr)" # :nocode: :example:
( /needle/.match("haystack") ).should eq( nil )

puts "# regex.cr:41 (004.cr)" # :nocode: :example:
( /hay/.match("haystack") ).class.to_s.should eq( "Regex::MatchData" )

puts "# regex.cr:54 (005.cr)" # :nocode: :example:
( /stack/ =~ "haystack" ).should eq( 3 )
( "haystack" =~ /stack/ ).should eq( 3 )
( $~ ).class.to_s.should eq( "Regex::MatchData" )
( /needle/ =~ "haystack" ).should eq( nil )
( "haystack" =~ /needle/ ).should eq( nil )
expect_raises(Exception) { $~ }

puts "# regex.cr:67 (006.cr)" # :nocode: :example:
( /hay/.match("haystack") ).class.to_s.should eq( "Regex::MatchData" )
( "haystack".match(/hay/) ).class.to_s.should eq( "Regex::MatchData" )
( $~ ).class.to_s.should eq( "Regex::MatchData" )
( /needle/.match("haystack") ).should eq( nil )
( "haystack".match(/needle/) ).should eq( nil )
expect_raises(Exception) { $~ }

puts "# regex.cr:103 (007.cr)" # :nocode: :example:
( /a(sd)f/.match("_asdf_") ).class.to_s.should eq( "Regex::MatchData" )
( /a(sd)f/.match("_asdf_").try &.[1] ).to_s.should eq( "sd" )
( /a(?<grp>sd)f/.match("_asdf_") ).class.to_s.should eq( "Regex::MatchData" )
( /a(?<grp>sd)f/.match("_asdf_").try &.["grp"] ).to_s.should eq( "sd" )

puts "# regex.cr:119 (008.cr)" # :nocode: :example:
( /(spice)(s)?/.match("spice") ).class.to_s.should eq( "Regex::MatchData" )
( $1 ).to_s.should eq( "spice" )
# $2                           # => raises Exception

puts "# regex.cr:136 (009.cr)" # :nocode: :example:
( /fo*/.match("_f_") ).class.to_s.should eq( "Regex::MatchData" )
( /fo+/.match("_f_") ).should eq( nil )
( /fo*/.match("_foo_") ).class.to_s.should eq( "Regex::MatchData" )
( /fo{3,}/.match("_foo_") ).should eq( nil )
( /fo{1,3}/.match("_foo_") ).class.to_s.should eq( "Regex::MatchData" )
( /fo*/.match("_foo_") ).class.to_s.should eq( "Regex::MatchData" )
( /fo*/.match("_foooooooo_") ).class.to_s.should eq( "Regex::MatchData" )
( /fo{,3}/.match("_foooo_") ).should eq( nil )
( /f(op)*/.match("fopopo") ).class.to_s.should eq( "Regex::MatchData" )
( /foo?bar/.match("foobar") ).class.to_s.should eq( "Regex::MatchData" )
( /foo?bar/.match("fobar") ).class.to_s.should eq( "Regex::MatchData" )

puts "# regex.cr:159 (010.cr)" # :nocode: :example:
( /foo|bar/.match("foo") ).class.to_s.should eq( "Regex::MatchData" )
( /foo|bar/.match("bar") ).class.to_s.should eq( "Regex::MatchData" )
( /_(x|y)_/.match("_x_") ).class.to_s.should eq( "Regex::MatchData" )
( /_(x|y)_/.match("_y_") ).class.to_s.should eq( "Regex::MatchData" )
( /_(x|y)_/.match("_(x|y)_") ).should eq( nil )
( /_(x|y)_/.match("_(x|y)_") ).should eq( nil )
( /_._/.match("_x_") ).class.to_s.should eq( "Regex::MatchData" )
( /_[xyz]_/.match("_x_") ).class.to_s.should eq( "Regex::MatchData" )
( /_[a-z]_/.match("_x_") ).class.to_s.should eq( "Regex::MatchData" )
( /_[^a-z]_/.match("_x_") ).should eq( nil )
( /_[^a-wy-z]_/.match("_x_") ).class.to_s.should eq( "Regex::MatchData" )

puts "# regex.cr:180 (011.cr)" # :nocode: :example:
( /asdf/ =~ "ASDF" ).should eq( nil )
( /asdf/i =~ "ASDF" ).should eq( 0 )
( /^z/i =~ "ASDF\nZ" ).should eq( nil )
( /^z/im =~ "ASDF\nZ" ).should eq( 5 )

puts "# regex.cr:228 (012.cr)" # :nocode: :example:
( /ab+c/ix.options ).should eq( Regex::Options::IGNORE_CASE | Regex::Options::EXTENDED )
( /ab+c/ix.options.to_s ).to_s.should eq( "IGNORE_CASE | EXTENDED" )

puts "# regex.cr:236 (013.cr)" # :nocode: :example:
( /ab+c/x.source ).to_s.should eq( "ab+c" )

puts "# regex.cr:243 (014.cr)" # :nocode: :example:
( Regex.new("^a-z+:\\s+\\w+") ).should eq( /^a-z+:\s+\w+/ )
( Regex.new("cat", Regex::Options::IGNORE_CASE) ).should eq( /cat/i )
options = Regex::Options::IGNORE_CASE | Regex::Options::EXTENDED
( Regex.new("dog", options) ).should eq( /dog/ix )

puts "# regex.cr:264 (015.cr)" # :nocode: :example:
( Regex.error?("(foo|bar)") ).should eq( nil )
( Regex.error?("(foo|bar") ).to_s.should eq( "missing ) at 8" )

puts "# regex.cr:279 (016.cr)" # :nocode: :example:
( Regex.needs_escape?('*') ).should eq( true )
( Regex.needs_escape?('@') ).should eq( false )

puts "# regex.cr:289 (017.cr)" # :nocode: :example:
( Regex.needs_escape?("10$") ).should eq( true )
( Regex.needs_escape?("foo") ).should eq( false )

puts "# regex.cr:300 (018.cr)" # :nocode: :example:
( string = Regex.escape("\*?{}.") ).to_s.should eq( "\\*\\?\\{\\}\\." )
( /#{string}/ ).should eq( /\*\?\{\}\./ )

puts "# regex.cr:325 (019.cr)" # :nocode: :example:
re = Regex.union([/skiing/i, "sledding"])
( re.match("Skiing") ).class.to_s.should eq( "Regex::MatchData" )
( re.match("sledding") ).class.to_s.should eq( "Regex::MatchData" )
re = Regex.union({/skiing/i, "sledding"})
( re.match("Skiing") ).class.to_s.should eq( "Regex::MatchData" )
( re.match("sledding") ).class.to_s.should eq( "Regex::MatchData" )

puts "# regex.cr:342 (020.cr)" # :nocode: :example:
re = Regex.union(/skiing/i, "sledding")
( re.match("Skiing") ).class.to_s.should eq( "Regex::MatchData" )
( re.match("sledding") ).class.to_s.should eq( "Regex::MatchData" )

puts "# regex.cr:364 (021.cr)" # :nocode: :example:
re = /skiing/i + /sledding/
( re.match("Skiing") ).class.to_s.should eq( "Regex::MatchData" )
( re.match("sledding") ).class.to_s.should eq( "Regex::MatchData" )

puts "# regex.cr:375 (022.cr)" # :nocode: :example:
( /abc/ == /abc/i ).should eq( false )
( /abc/i == /ABC/i ).should eq( false )
( /abc/i == /abc/i ).should eq( true )

puts "# regex.cr:388 (023.cr)" # :nocode: :example:
a = "HELLO"
b = case a
    when /^[a-z]*$/
      "Lower case"
    when /^[A-Z]*$/
      "Upper case"
    else
      "Mixed case"
    end
( b ).to_s.should eq( "Upper case" )

puts "# regex.cr:411 (024.cr)" # :nocode: :example:
( /at/ =~ "input data" ).should eq( 7 )
( /ax/ =~ "input data" ).should eq( nil )

puts "# regex.cr:423 (025.cr)" # :nocode: :example:
( /at/ =~ "input data" ).should eq( 7 )
( /ax/ =~ "input data" ).should eq( nil )

puts "# regex.cr:435 (026.cr)" # :nocode: :example:
( /ab+c/ix.inspect ).to_s.should eq( "/ab+c/ix" )

puts "# regex.cr:452 (027.cr)" # :nocode: :example:
( /(.)(.)(.)/.match("abc").try &.[2] ).to_s.should eq( "b" )
( /(.)(.)/.match("abc", 1).try &.[2] ).to_s.should eq( "c" )
( /(.)(.)/.match("クリスタル", 3).try &.[2] ).to_s.should eq( "ル" )

puts "# regex.cr:472 (028.cr)" # :nocode: :example:
( /(.)(.)(.)/.match_at_byte_index("abc").try &.[2] ).to_s.should eq( "b" )
( /(.)(.)/.match_at_byte_index("abc", 1).try &.[2] ).to_s.should eq( "c" )
( /(.)(.)/.match_at_byte_index("クリスタル", 3).try &.[2] ).to_s.should eq( "ス" )

puts "# regex.cr:496 (029.cr)" # :nocode: :example:
( /(.)/.name_table ).to_s.should eq( "{}" )
( /(?<foo>.)/.name_table ).should eq( {1 => "foo"} )
( /(?<foo>.)(?<bar>.)/.name_table ).should eq( {2 => "bar", 1 => "foo"} )
( /(.)(?<foo>.)(.)(?<bar>.)(.)/.name_table ).should eq( {4 => "bar", 2 => "foo"} )

puts "# regex.cr:528 (030.cr)" # :nocode: :example:
( re = /A*/i ).should eq( /A*/i )
( re.to_s ).to_s.should eq( "(?i-msx:A*)" )
( "Crystal".match(/t#{re}l/) ).class.to_s.should eq( "Regex::MatchData" )
( re = /A*/ ).to_s.should eq( "(?-imsx:A*)" )
( "Crystal".match(/t#{re}l/) ).should eq( nil )


end
