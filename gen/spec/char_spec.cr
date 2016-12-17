require "spec"

it "char.cr" do
puts # :nocode:

puts "# char.cr:8 (001.cr)" # :nocode: :example:
'a'
'z'
'0'
'_'
'あ'

puts "# char.cr:18 (002.cr)" # :nocode: :example:
'\'' # single quote
'\\' # backslash
'\e' # escape
'\f' # form feed
'\n' # newline
'\r' # carriage return
'\t' # tab
'\v' # vertical tab

puts "# char.cr:31 (003.cr)" # :nocode: :example:
'\u0041' # == 'A'

puts "# char.cr:37 (004.cr)" # :nocode: :example:
'\u{41}' # == 'A'

puts "# char.cr:57 (005.cr)" # :nocode: :example:
( 'a' - 'a' ).should eq( 0 )
( 'b' - 'a' ).should eq( 1 )
( 'c' - 'a' ).should eq( 2 )

puts "# char.cr:68 (006.cr)" # :nocode: :example:
( 'f' + "oo" ).to_s.should eq( "foo" )

puts "# char.cr:88 (007.cr)" # :nocode: :example:
( 'a' + 1 ).should eq( 'b' )
( 'a' + 2 ).should eq( 'c' )

puts "# char.cr:98 (008.cr)" # :nocode: :example:
( 'c' - 1 ).should eq( 'b' )
( 'c' - 2 ).should eq( 'a' )

puts "# char.cr:108 (009.cr)" # :nocode: :example:
( 'a' <=> 'c' ).should eq( -2 )

puts "# char.cr:125 (010.cr)" # :nocode: :example:
( '4'.ascii_number? ).should eq( true )
( 'z'.ascii_number? ).should eq( false )
( 'z'.ascii_number?(36) ).should eq( true )

puts "# char.cr:136 (011.cr)" # :nocode: :example:
( '1'.number? ).should eq( true )
( 'a'.number? ).should eq( false )

puts "# char.cr:146 (012.cr)" # :nocode: :example:
( 'c'.ascii_lowercase? ).should eq( true )
( 'ç'.lowercase? ).should eq( true )
( 'G'.ascii_lowercase? ).should eq( false )
( '.'.ascii_lowercase? ).should eq( false )

puts "# char.cr:158 (013.cr)" # :nocode: :example:
( 'c'.lowercase? ).should eq( true )
( 'ç'.lowercase? ).should eq( true )
( 'G'.lowercase? ).should eq( false )
( '.'.lowercase? ).should eq( false )

puts "# char.cr:170 (014.cr)" # :nocode: :example:
( 'H'.ascii_uppercase? ).should eq( true )
( 'Á'.ascii_uppercase? ).should eq( false )
( 'c'.ascii_uppercase? ).should eq( false )
( '.'.ascii_uppercase? ).should eq( false )

puts "# char.cr:182 (015.cr)" # :nocode: :example:
( 'H'.uppercase? ).should eq( true )
( 'Á'.uppercase? ).should eq( true )
( 'c'.uppercase? ).should eq( false )
( '.'.uppercase? ).should eq( false )

puts "# char.cr:194 (016.cr)" # :nocode: :example:
( 'c'.ascii_letter? ).should eq( true )
( 'á'.ascii_letter? ).should eq( false )
( '8'.ascii_letter? ).should eq( false )

puts "# char.cr:205 (017.cr)" # :nocode: :example:
( 'c'.letter? ).should eq( true )
( 'á'.letter? ).should eq( true )
( '8'.letter? ).should eq( false )

puts "# char.cr:216 (018.cr)" # :nocode: :example:
( 'c'.ascii_alphanumeric? ).should eq( true )
( '8'.ascii_alphanumeric? ).should eq( true )
( '.'.ascii_alphanumeric? ).should eq( false )

puts "# char.cr:227 (019.cr)" # :nocode: :example:
( 'c'.alphanumeric? ).should eq( true )
( '8'.alphanumeric? ).should eq( true )
( '.'.alphanumeric? ).should eq( false )

puts "# char.cr:238 (020.cr)" # :nocode: :example:
( ' '.ascii_whitespace? ).should eq( true )
( '\t'.ascii_whitespace? ).should eq( true )
( 'b'.ascii_whitespace? ).should eq( false )

puts "# char.cr:249 (021.cr)" # :nocode: :example:
( ' '.whitespace? ).should eq( true )
( '\t'.whitespace? ).should eq( true )
( 'b'.whitespace? ).should eq( false )

puts "# char.cr:260 (022.cr)" # :nocode: :example:
( '5'.hex? ).should eq( true )
( 'a'.hex? ).should eq( true )
( 'F'.hex? ).should eq( true )
( 'g'.hex? ).should eq( false )

puts "# char.cr:284 (023.cr)" # :nocode: :example:
( 'l'.in_set? "lo" ).should eq( true )
( 'l'.in_set? "lo", "o" ).should eq( false )
( 'l'.in_set? "hello", "^l" ).should eq( false )
( 'l'.in_set? "j-m" ).should eq( true )

( '^'.in_set? "\\^aeiou" ).should eq( true )
( '-'.in_set? "a\\-eo" ).should eq( true )

( '\\'.in_set? "\\" ).should eq( true )
( '\\'.in_set? "\\A" ).should eq( false )
( '\\'.in_set? "X-\\w" ).should eq( true )

puts "# char.cr:358 (024.cr)" # :nocode: :example:
( 'Z'.downcase ).should eq( 'z' )
( 'x'.downcase ).should eq( 'x' )
( '.'.downcase ).should eq( '.' )

puts "# char.cr:385 (025.cr)" # :nocode: :example:
( 'z'.upcase ).should eq( 'Z' )
( 'X'.upcase ).should eq( 'X' )
( '.'.upcase ).should eq( '.' )

puts "# char.cr:400 (026.cr)" # :nocode: :example:
'z'.upcase { |v| puts v } # prints 'Z'
'ﬄ'.upcase { |v| puts v } # prints 'F', 'F', 'L'

puts "# char.cr:415 (027.cr)" # :nocode: :example:
( 'a'.succ ).should eq( 'b' )
( 'あ'.succ ).should eq( 'ぃ' )

puts "# char.cr:427 (028.cr)" # :nocode: :example:
( 'b'.pred ).should eq( 'a' )
( 'ぃ'.pred ).should eq( 'あ' )

puts "# char.cr:437 (029.cr)" # :nocode: :example:
('\u0000'..'\u0019').each do |char|
(   char.control? ).should eq( true )
end

('\u007F'..'\u009F').each do |char|
(   char.control? ).should eq( true )
end

puts "# char.cr:462 (030.cr)" # :nocode: :example:
( 'a'.inspect ).to_s.should eq( "'a'" )
( '\t'.inspect ).to_s.should eq( "'\\t'" )
( 'あ'.inspect ).to_s.should eq( "'あ'" )
( '\u0012'.inspect ).to_s.should eq( "'\\u{12}'" )

puts "# char.cr:490 (031.cr)" # :nocode: :example:
( 'a'.dump ).to_s.should eq( "'a'" )
( '\t'.dump ).to_s.should eq( "'\\t'" )
( 'あ'.dump ).to_s.should eq( "'\\u{3042}'" )
( '\u0012'.dump ).to_s.should eq( "'\\u{12}'" )

puts "# char.cr:541 (032.cr)" # :nocode: :example:
( '1'.to_i ).should eq( 1 )
( '8'.to_i ).should eq( 8 )
expect_raises(ArgumentError) { 'c'.to_i }
( '1'.to_i(16) ).should eq( 1 )
( 'a'.to_i(16) ).should eq( 10 )
( 'f'.to_i(16) ).should eq( 15 )
expect_raises(ArgumentError) { 'z'.to_i(16) }

puts "# char.cr:557 (033.cr)" # :nocode: :example:
( '1'.to_i? ).should eq( 1 )
( '8'.to_i? ).should eq( 8 )
( 'c'.to_i? ).should eq( nil )
( '1'.to_i?(16) ).should eq( 1 )
( 'a'.to_i?(16) ).should eq( 10 )
( 'f'.to_i?(16) ).should eq( 15 )
( 'z'.to_i?(16) ).should eq( nil )

puts "# char.cr:607 (034.cr)" # :nocode: :example:
( '1'.to_f ).to_s.should eq( "1.0" )
( '8'.to_f ).to_s.should eq( "8.0" )
expect_raises(ArgumentError) { 'c'.to_f }

puts "# char.cr:619 (035.cr)" # :nocode: :example:
( '1'.to_f? ).to_s.should eq( "1.0" )
( '8'.to_f? ).to_s.should eq( "8.0" )
( 'c'.to_f? ).should eq( nil )

puts "# char.cr:650 (036.cr)" # :nocode: :example:
puts "'a'"
'a'.each_byte do |byte|
  puts byte
end
puts

puts "'あ'"
'あ'.each_byte do |byte|
  puts byte
end

puts "# char.cr:703 (037.cr)" # :nocode: :example:
( 'a'.bytesize ).should eq( 1 )
( '好'.bytesize ).should eq( 3 )

puts "# char.cr:730 (038.cr)" # :nocode: :example:
( 'a'.bytes ).should eq( [97] )
( 'あ'.bytes ).should eq( [227, 129, 130] )

puts "# char.cr:744 (039.cr)" # :nocode: :example:
( 'a'.to_s ).to_s.should eq( "a" )
( 'あ'.to_s ).to_s.should eq( "あ" )

puts "# char.cr:782 (040.cr)" # :nocode: :example:
( 'c'.ord ).should eq( 99 )
( 'c' === 99_u8 ).should eq( true )
( 'c' === 99 ).should eq( true )
( 'z' === 99 ).should eq( false )


end
