require "spec"
require "regex/match_data"
it "regex/match_data.cr" do
puts # :nocode:

puts "# regex/match_data.cr:6 (001.cr)" # :nocode: :example:
if md = "Crystal".match(/[p-s]/)
(   md.string ).to_s.should eq( "Crystal" )
(   md[0] ).to_s.should eq( "r" )
(   md[1]? ).should eq( nil )
end

puts "# regex/match_data.cr:21 (002.cr)" # :nocode: :example:
( "Crystal".match(/[p-s]/).not_nil!.regex ).should eq( /[p-s]/ )

puts "# regex/match_data.cr:28 (003.cr)" # :nocode: :example:
( "Crystal".match(/[p-s]/).not_nil!.group_size ).should eq( 0 )
( "Crystal".match(/r(ys)/).not_nil!.group_size ).should eq( 1 )
( "Crystal".match(/r(ys)(?<ok>ta)/).not_nil!.group_size ).should eq( 2 )

puts "# regex/match_data.cr:37 (004.cr)" # :nocode: :example:
( "Crystal".match(/[p-s]/).not_nil!.string ).to_s.should eq( "Crystal" )

puts "# regex/match_data.cr:48 (005.cr)" # :nocode: :example:
( "Crystal".match(/[p-s]/).not_nil!.size ).should eq( 1 )
( "Crystal".match(/r(ys)/).not_nil!.size ).should eq( 2 )
( "Crystal".match(/r(ys)(?<ok>ta)/).not_nil!.size ).should eq( 3 )

puts "# regex/match_data.cr:62 (006.cr)" # :nocode: :example:
( "Crystal".match(/r/).not_nil!.begin(0) ).should eq( 1 )
( "Crystal".match(/r(ys)/).not_nil!.begin(1) ).should eq( 2 )
( "クリスタル".match(/リ(ス)/).not_nil!.begin(0) ).should eq( 1 )

puts "# regex/match_data.cr:76 (007.cr)" # :nocode: :example:
( "Crystal".match(/r/).not_nil!.end(0) ).should eq( 2 )
( "Crystal".match(/r(ys)/).not_nil!.end(1) ).should eq( 4 )
( "クリスタル".match(/リ(ス)/).not_nil!.end(0) ).should eq( 3 )

puts "# regex/match_data.cr:90 (008.cr)" # :nocode: :example:
( "Crystal".match(/r/).not_nil!.byte_begin(0) ).should eq( 1 )
( "Crystal".match(/r(ys)/).not_nil!.byte_begin(1) ).should eq( 2 )
( "クリスタル".match(/リ(ス)/).not_nil!.byte_begin(0) ).should eq( 3 )

puts "# regex/match_data.cr:106 (009.cr)" # :nocode: :example:
( "Crystal".match(/r/).not_nil!.byte_end(0) ).should eq( 2 )
( "Crystal".match(/r(ys)/).not_nil!.byte_end(1) ).should eq( 4 )
( "クリスタル".match(/リ(ス)/).not_nil!.byte_end(0) ).should eq( 9 )

puts "# regex/match_data.cr:122 (010.cr)" # :nocode: :example:
( "Crystal".match(/r(ys)/).not_nil![0]? ).to_s.should eq( "rys" )
( "Crystal".match(/r(ys)/).not_nil![1]? ).to_s.should eq( "ys" )
( "Crystal".match(/r(ys)/).not_nil![2]? ).should eq( nil )

puts "# regex/match_data.cr:140 (011.cr)" # :nocode: :example:
( "Crystal".match(/r(ys)/).not_nil![1] ).to_s.should eq( "ys" )
expect_raises(IndexError) { "Crystal".match(/r(ys)/).not_nil![2] }

puts "# regex/match_data.cr:156 (012.cr)" # :nocode: :example:
( "Crystal".match(/r(?<ok>ys)/).not_nil!["ok"]? ).to_s.should eq( "ys" )
( "Crystal".match(/r(?<ok>ys)/).not_nil!["ng"]? ).should eq( nil )

puts "# regex/match_data.cr:164 (013.cr)" # :nocode: :example:
( "Crystal".match(/(?<ok>Cr).*(?<ok>al)/).not_nil!["ok"]? ).to_s.should eq( "al" )

puts "# regex/match_data.cr:183 (014.cr)" # :nocode: :example:
( "Crystal".match(/r(?<ok>ys)/).not_nil!["ok"] ).to_s.should eq( "ys" )
expect_raises(KeyError) { "Crystal".match(/r(?<ok>ys)/).not_nil!["ng"] }

puts "# regex/match_data.cr:191 (015.cr)" # :nocode: :example:
( "Crystal".match(/(?<ok>Cr).*(?<ok>al)/).not_nil!["ok"] ).to_s.should eq( "al" )

puts "# regex/match_data.cr:222 (016.cr)" # :nocode: :example:
( "Crystal".match(/yst/).not_nil!.pre_match ).to_s.should eq( "Cr" )

puts "# regex/match_data.cr:232 (017.cr)" # :nocode: :example:
( "Crystal".match(/yst/).not_nil!.post_match ).to_s.should eq( "al" )

puts "# regex/match_data.cr:243 (018.cr)" # :nocode: :example:
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
( match.captures ).should eq( ["Cr", "st"] )

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(stal)?/).not_nil!
( match.captures ).should eq( ["Cr", nil] )

puts "# regex/match_data.cr:265 (019.cr)" # :nocode: :example:
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
( match.named_captures ).should eq( {"name1" => "y", "name2" => "al"} )

# When this regex has an optional group, result hash may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(?<name1>Cr)(?<name2>stal)?/).not_nil!
( match.named_captures ).should eq( {"name1" => "Cr", "name2" => nil} )

puts "# regex/match_data.cr:289 (020.cr)" # :nocode: :example:
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
( match.to_a ).should eq( ["Crystal", "Cr", "y", "st", "al"] )

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(?<name1>stal)?/).not_nil!
( match.to_a ).should eq( ["Cr", "Cr", nil] )

puts "# regex/match_data.cr:304 (021.cr)" # :nocode: :example:
match = "Crystal".match(/(Cr)(?<name1>y)(st)(?<name2>al)/).not_nil!
( match.to_h ).should eq( {0 => "Crystal", 1 => "Cr", "name1" => "y", 3 => "st", "name2" => "al"} )

# When this regex has an optional group, result array may contain
# a `nil` if this group is not matched.
match = "Crystal".match(/(Cr)(?<name1>stal)?/).not_nil!
( match.to_h ).should eq( {0 => "Cr", 1 => "Cr", "name1" => nil} )


end
