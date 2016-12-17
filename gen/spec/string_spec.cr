require "spec"

it "string.cr" do
puts # :nocode:

puts "# string.cr:9 (001.cr)" # :nocode: :example:
"hello world"

puts "# string.cr:15 (002.cr)" # :nocode: :example:
"\"" # double quote
"\\" # backslash
"\e" # escape
"\f" # form feed
"\n" # newline
"\r" # carriage return
"\t" # tab
"\v" # vertical tab

puts "# string.cr:28 (003.cr)" # :nocode: :example:
"\u0041" # == "A"

puts "# string.cr:34 (004.cr)" # :nocode: :example:
"\u{41}" # == "A"

puts "# string.cr:40 (005.cr)" # :nocode: :example:
"hello
      world" # same as "hello\n      world"

puts "# string.cr:49 (006.cr)" # :nocode: :example:
"hello " \
"world, " \
"no newlines" # same as "hello world, no newlines"

puts "# string.cr:57 (007.cr)" # :nocode: :example:
"hello \
     world, \
     no newlines" # same as "hello world, no newlines"

puts "# string.cr:68 (008.cr)" # :nocode: :example:
# Supports double quotes and nested parentheses
%(hello ("world")) # same as "hello (\"world\")"

# Supports double quotes and nested brackets
%[hello ["world"]] # same as "hello [\"world\"]"

# Supports double quotes and nested curlies
%{hello {"world"}} # same as "hello {\"world\"}"

# Supports double quotes and nested angles
%<hello <"world">> # same as "hello <\"world\">"

puts "# string.cr:84 (009.cr)" # :nocode: :example:
a = 1
b = 2
"sum = #{a + b}" # "sum = 3"

puts "# string.cr:103 (010.cr)" # :nocode: :example:
# here 255 is not a valid byte value in the UTF-8 encoding
string = String.new(Bytes[255, 97])
( string.valid_encoding? ).should eq( false )

# The first char here is the unicode replacement char
( string.chars ).should eq( ['�', 'a'] )

puts "# string.cr:115 (011.cr)" # :nocode: :example:
# Octal escape sequences
"\101" # # => "A"
"\12"  # # => "\n"
"\1"   # string with one character with code point 1
"\377" # string with one byte with value 255

# Hexadecimal escape sequences
"\x41" # # => "A"
"\xFF" # string with one byte with value 255

puts "# string.cr:150 (012.cr)" # :nocode: :example:
slice = Slice.new(4) { |i| ('a'.ord + i).to_u8 }
( String.new(slice) ).to_s.should eq( "abcd" )

puts "# string.cr:164 (013.cr)" # :nocode: :example:
slice = Slice.new(2, 0_u8)
slice[0] = 186_u8
slice[1] = 195_u8
( String.new(slice, "GB2312") ).to_s.should eq( "好" )

puts "# string.cr:186 (014.cr)" # :nocode: :example:
ptr = Pointer.malloc(5) { |i| i == 4 ? 0_u8 : ('a'.ord + i).to_u8 }
( String.new(ptr) ).to_s.should eq( "abcd" )

puts "# string.cr:201 (015.cr)" # :nocode: :example:
ptr = Pointer.malloc(4) { |i| ('a'.ord + i).to_u8 }
( String.new(ptr, 2) ).to_s.should eq( "ab" )

puts "# string.cr:225 (016.cr)" # :nocode: :example:
str = String.new(4) do |buffer|
  buffer[0] = 'a'.ord.to_u8
  buffer[1] = 'b'.ord.to_u8
  {2, 2}
end
( str ).to_s.should eq( "ab" )

puts "# string.cr:260 (017.cr)" # :nocode: :example:
str = String.build do |str|
  str << "hello "
  str << 1
end
( str ).to_s.should eq( "hello 1" )

puts "# string.cr:275 (018.cr)" # :nocode: :example:
( "hello".bytesize ).should eq( 5 )
( "你好".bytesize ).should eq( 6 )

puts "# string.cr:295 (019.cr)" # :nocode: :example:
( "12345".to_i ).should eq( 12345 )
expect_raises(ArgumentError) { "0a".to_i }
expect_raises(ArgumentError) { "hello".to_i }
( "0a".to_i(16) ).should eq( 10 )
( "1100101".to_i(2) ).should eq( 101 )
( "1100101".to_i(8) ).should eq( 294977 )
( "1100101".to_i(10) ).should eq( 1100101 )
( "1100101".to_i(base: 16) ).should eq( 17826049 )

expect_raises(ArgumentError) { "12_345".to_i }
( "12_345".to_i(underscore: true) ).should eq( 12345 )

( "  12345  ".to_i ).should eq( 12345 )
expect_raises(ArgumentError) { "  12345  ".to_i(whitespace: false) }

expect_raises(ArgumentError) { "0x123abc".to_i }
( "0x123abc".to_i(prefix: true) ).should eq( 1194684 )

expect_raises(ArgumentError) { "99 red balloons".to_i }
( "99 red balloons".to_i(strict: false) ).should eq( 99 )

puts "# string.cr:324 (020.cr)" # :nocode: :example:
( "12345".to_i? ).should eq( 12345 )
( "99 red balloons".to_i? ).should eq( nil )
( "0a".to_i?(strict: false) ).should eq( 0 )
( "hello".to_i? ).should eq( nil )

puts "# string.cr:337 (021.cr)" # :nocode: :example:
( "12345".to_i { 0 } ).should eq( 12345 )
( "hello".to_i { 0 } ).should eq( 0 )

puts "# string.cr:621 (022.cr)" # :nocode: :example:
( "123.45e1".to_f ).to_s.should eq( "1234.5" )
expect_raises(ArgumentError) { "45.67 degrees".to_f }
expect_raises(ArgumentError) { "thx1138".to_f(strict: false) }
expect_raises(ArgumentError) { " 1.2".to_f(whitespace: false) }
( "1.2foo".to_f(strict: false) ).to_s.should eq( "1.2" )

puts "# string.cr:639 (023.cr)" # :nocode: :example:
( "123.45e1".to_f? ).to_s.should eq( "1234.5" )
( "45.67 degrees".to_f? ).should eq( nil )
( "thx1138".to_f? ).should eq( nil )
( " 1.2".to_f?(whitespace: false) ).should eq( nil )
( "1.2foo".to_f?(strict: false) ).to_s.should eq( "1.2" )

puts "# string.cr:709 (024.cr)" # :nocode: :example:
"hello"[0]  # 'h'
"hello"[1]  # 'e'
"hello"[-1] # 'o'
"hello"[-2] # 'l'
expect_raises(IndexError) { "hello"[5] }

puts "# string.cr:726 (025.cr)" # :nocode: :example:
"hello"[0..2]   # "hel"
"hello"[0...2]  # "he"
"hello"[1..-1]  # "ello"
"hello"[1...-1] # "ell"

puts "# string.cr:910 (026.cr)" # :nocode: :example:
( "hEllO".downcase ).to_s.should eq( "hello" )

puts "# string.cr:937 (027.cr)" # :nocode: :example:
( "hEllO".upcase ).to_s.should eq( "HELLO" )

puts "# string.cr:964 (028.cr)" # :nocode: :example:
( "hEllO".capitalize ).to_s.should eq( "Hello" )

puts "# string.cr:997 (029.cr)" # :nocode: :example:
( "string\r\n".chomp ).to_s.should eq( "string" )
( "string\n\r".chomp ).to_s.should eq( "string\n" )
( "string\n".chomp ).to_s.should eq( "string" )
( "string".chomp ).to_s.should eq( "string" )
( "x".chomp.chomp ).to_s.should eq( "x" )

puts "# string.cr:1024 (030.cr)" # :nocode: :example:
( "hello".chomp('o') ).to_s.should eq( "hell" )
( "hello".chomp('a') ).to_s.should eq( "hello" )

puts "# string.cr:1041 (031.cr)" # :nocode: :example:
( "hello".chomp("llo") ).to_s.should eq( "he" )
( "hello".chomp("ol") ).to_s.should eq( "hello" )

puts "# string.cr:1058 (032.cr)" # :nocode: :example:
( "hello".lchop ).to_s.should eq( "ello" )
( "".lchop ).to_s.should eq( "" )

puts "# string.cr:1071 (033.cr)" # :nocode: :example:
( "hello".lchop('h') ).to_s.should eq( "ello" )
( "hello".lchop('g') ).to_s.should eq( "hello" )

puts "# string.cr:1085 (034.cr)" # :nocode: :example:
( "hello".lchop("hel") ).to_s.should eq( "lo" )
( "hello".lchop("eh") ).to_s.should eq( "hello" )

puts "# string.cr:1100 (035.cr)" # :nocode: :example:
( "string\r\n".rchop ).to_s.should eq( "string\r" )
( "string\n\r".rchop ).to_s.should eq( "string\n" )
( "string\n".rchop ).to_s.should eq( "string" )
( "string".rchop ).to_s.should eq( "strin" )
( "x".rchop.rchop ).to_s.should eq( "" )

puts "# string.cr:1119 (036.cr)" # :nocode: :example:
( "string".rchop('g') ).to_s.should eq( "strin" )
( "string".rchop('x') ).to_s.should eq( "string" )

puts "# string.cr:1135 (037.cr)" # :nocode: :example:
( "string".rchop("ing") ).to_s.should eq( "str" )
( "string".rchop("inx") ).to_s.should eq( "string" )

puts "# string.cr:1155 (038.cr)" # :nocode: :example:
( "好".encode("GB2312") ).should eq( Bytes[186, 195] )
( "好".bytes ).should eq( [229, 165, 189] )

puts "# string.cr:1192 (039.cr)" # :nocode: :example:
( "0102031aff".hexbytes ).should eq( Bytes[1, 2, 3, 26, 255] )
expect_raises(ArgumentError) { "1".hexbytes }
expect_raises(ArgumentError) { "hello world".hexbytes }

puts "# string.cr:1207 (040.cr)" # :nocode: :example:
( "0102031aff".hexbytes? ).should eq( Bytes[1, 2, 3, 26, 255] )
( "1".hexbytes? ).should eq( nil )
( "hello world".hexbytes? ).should eq( nil )

puts "# string.cr:1236 (041.cr)" # :nocode: :example:
( "abcd".insert(0, 'X') ).to_s.should eq( "Xabcd" )
( "abcd".insert(3, 'X') ).to_s.should eq( "abcXd" )
( "abcd".insert(4, 'X') ).to_s.should eq( "abcdX" )
( "abcd".insert(-3, 'X') ).to_s.should eq( "abXcd" )
( "abcd".insert(-1, 'X') ).to_s.should eq( "abcdX" )

expect_raises(IndexError) { "abcd".insert(5, 'X') }
expect_raises(IndexError) { "abcd".insert(-6, 'X') }

puts "# string.cr:1267 (042.cr)" # :nocode: :example:
( "abcd".insert(0, "FOO") ).to_s.should eq( "FOOabcd" )
( "abcd".insert(3, "FOO") ).to_s.should eq( "abcFOOd" )
( "abcd".insert(4, "FOO") ).to_s.should eq( "abcdFOO" )
( "abcd".insert(-3, "FOO") ).to_s.should eq( "abFOOcd" )
( "abcd".insert(-1, "FOO") ).to_s.should eq( "abcdFOO" )

expect_raises(IndexError) { "abcd".insert(5, "FOO") }
expect_raises(IndexError) { "abcd".insert(-6, "FOO") }

puts "# string.cr:1303 (043.cr)" # :nocode: :example:
( "    hello    ".strip ).to_s.should eq( "hello" )
( "\tgoodbye\r\n".strip ).to_s.should eq( "goodbye" )

puts "# string.cr:1319 (044.cr)" # :nocode: :example:
( "aaabcdaaa".strip('a') ).to_s.should eq( "bcd" )

puts "# string.cr:1338 (045.cr)" # :nocode: :example:
( "abcdefcba".strip("abc") ).to_s.should eq( "def" )

puts "# string.cr:1363 (046.cr)" # :nocode: :example:
( "bcadefcba".strip { |c| 'a' <= c <= 'c' } ).to_s.should eq( "def" )

puts "# string.cr:1380 (047.cr)" # :nocode: :example:
( "    hello    ".rstrip ).to_s.should eq( "    hello" )
( "\tgoodbye\r\n".rstrip ).to_s.should eq( "\tgoodbye" )

puts "# string.cr:1390 (048.cr)" # :nocode: :example:
( "aaabcdaaa".rstrip('a') ).to_s.should eq( "aaabcd" )

puts "# string.cr:1403 (049.cr)" # :nocode: :example:
( "abcdefcba".rstrip("abc") ).to_s.should eq( "abcdef" )

puts "# string.cr:1422 (050.cr)" # :nocode: :example:
( "bcadefcba".rstrip { |c| 'a' <= c <= 'c' } ).to_s.should eq( "bcadef" )

puts "# string.cr:1434 (051.cr)" # :nocode: :example:
( "    hello    ".lstrip ).to_s.should eq( "hello    " )
( "\tgoodbye\r\n".lstrip ).to_s.should eq( "goodbye\r\n" )

puts "# string.cr:1444 (052.cr)" # :nocode: :example:
( "aaabcdaaa".lstrip('a') ).to_s.should eq( "bcdaaa" )

puts "# string.cr:1457 (053.cr)" # :nocode: :example:
( "bcadefcba".lstrip("abc") ).to_s.should eq( "defcba" )

puts "# string.cr:1476 (054.cr)" # :nocode: :example:
( "bcadefcba".lstrip { |c| 'a' <= c <= 'c' } ).to_s.should eq( "defcba" )

puts "# string.cr:1585 (055.cr)" # :nocode: :example:
( "aabbcc".tr("abc", "xyz") ).to_s.should eq( "xxyyzz" )
( "aabbcc".tr("abc", "x") ).to_s.should eq( "xxxxxx" )
( "aabbcc".tr("a", "xyz") ).to_s.should eq( "xxbbcc" )

puts "# string.cr:1638 (056.cr)" # :nocode: :example:
( "hello".sub { |char| char + 1 } ).to_s.should eq( "iello" )
( "hello".sub { "hi" } ).to_s.should eq( "hiello" )

puts "# string.cr:1656 (057.cr)" # :nocode: :example:
( "hello".sub('l', "lo") ).to_s.should eq( "helolo" )
( "hello world".sub('o', 'a') ).to_s.should eq( "hella world" )

puts "# string.cr:1684 (058.cr)" # :nocode: :example:
( "hello".sub(/./) { |s| s[0].ord.to_s + ' ' } ).to_s.should eq( "104 ello" )

puts "# string.cr:1697 (059.cr)" # :nocode: :example:
( "hello".sub(/[aeiou]/, "*") ).to_s.should eq( "h*llo" )

puts "# string.cr:1706 (060.cr)" # :nocode: :example:
( "hello".sub(/[aeiou]/, "(\\0)") ).to_s.should eq( "h(e)llo" )

puts "# string.cr:1721 (061.cr)" # :nocode: :example:
( "foo".sub(/o/, "x\\0x") ).to_s.should eq( "fxoxo" )
( "foofoo".sub(/(?<bar>oo)/, "|\\k<bar>|") ).to_s.should eq( "f|oo|foo" )
( "foo".sub(/o/, "\\\\0") ).to_s.should eq( "f\\0o" )

puts "# string.cr:1744 (062.cr)" # :nocode: :example:
( "hello".sub(/(he|l|o)/, {"he": "ha", "l": "la"}) ).to_s.should eq( "hallo" )
( "hello".sub(/(he|l|o)/, {"l": "la"}) ).to_s.should eq( "hello" )

puts "# string.cr:1761 (063.cr)" # :nocode: :example:
( "hello yellow".sub("ll", "dd") ).to_s.should eq( "heddo yellow" )

puts "# string.cr:1771 (064.cr)" # :nocode: :example:
( "hello yellow".sub("ll") { "dd" } ).to_s.should eq( "heddo yellow" )

puts "# string.cr:1788 (065.cr)" # :nocode: :example:
( "hello".sub({'a' => 'b', 'l' => 'd'}) ).to_s.should eq( "hedlo" )

puts "# string.cr:1832 (066.cr)" # :nocode: :example:
( "hello".sub(1, 'a') ).to_s.should eq( "hallo" )

puts "# string.cr:1848 (067.cr)" # :nocode: :example:
( "hello".sub(1, "eee") ).to_s.should eq( "heeello" )

puts "# string.cr:1882 (068.cr)" # :nocode: :example:
( "hello".sub(1..2, 'a') ).to_s.should eq( "halo" )

puts "# string.cr:1898 (069.cr)" # :nocode: :example:
( "hello".sub(1..2, "eee") ).to_s.should eq( "heeelo" )

puts "# string.cr:1992 (070.cr)" # :nocode: :example:
( "hello".gsub { |char| char + 1 } ).to_s.should eq( "ifmmp" )
( "hello".gsub { "hi" } ).to_s.should eq( "hihihihihi" )

puts "# string.cr:2007 (071.cr)" # :nocode: :example:
( "hello".gsub('l', "lo") ).to_s.should eq( "heloloo" )
( "hello world".gsub('o', 'a') ).to_s.should eq( "hella warld" )

puts "# string.cr:2043 (072.cr)" # :nocode: :example:
( "hello".gsub(/./) { |s| s[0].ord.to_s + ' ' } ).to_s.should eq( "104 101 108 108 111 " )

puts "# string.cr:2056 (073.cr)" # :nocode: :example:
( "hello".gsub(/[aeiou]/, '*') ).to_s.should eq( "h*ll*" )

puts "# string.cr:2065 (074.cr)" # :nocode: :example:
( "hello".gsub(/[aeiou]/, "(\\0)") ).to_s.should eq( "h(e)ll(o)" )

puts "# string.cr:2080 (075.cr)" # :nocode: :example:
( "foo".gsub(/o/, "x\\0x") ).to_s.should eq( "fxoxxox" )
( "foofoo".gsub(/(?<bar>oo)/, "|\\k<bar>|") ).to_s.should eq( "f|oo|f|oo|" )
( "foo".gsub(/o/, "\\\\0") ).to_s.should eq( "f\\0\\0" )

puts "# string.cr:2104 (076.cr)" # :nocode: :example:
# "he" and "l" are matched and replaced,
# but "o" is not and so is not included
( "hello".gsub(/(he|l|o)/, {"he": "ha", "l": "la"}) ).to_s.should eq( "halala" )

puts "# string.cr:2118 (077.cr)" # :nocode: :example:
( "hello yellow".gsub("ll", "dd") ).to_s.should eq( "heddo yeddow" )

puts "# string.cr:2132 (078.cr)" # :nocode: :example:
( "hello yellow".gsub("ll") { "dd" } ).to_s.should eq( "heddo yeddow" )

puts "# string.cr:2167 (079.cr)" # :nocode: :example:
( "hello".gsub({'e' => 'a', 'l' => 'd'}) ).to_s.should eq( "haddo" )

puts "# string.cr:2179 (080.cr)" # :nocode: :example:
( "hello".gsub({e: 'a', l: 'd'}) ).to_s.should eq( "haddo" )

puts "# string.cr:2224 (081.cr)" # :nocode: :example:
( "aabbcc".count { |c| ['a', 'b'].includes?(c) } ).should eq( 4 )

puts "# string.cr:2237 (082.cr)" # :nocode: :example:
( "aabbcc".count('a') ).should eq( 2 )

puts "# string.cr:2255 (083.cr)" # :nocode: :example:
( "aabbcc".delete { |c| ['a', 'b'].includes?(c) } ).to_s.should eq( "cc" )

puts "# string.cr:2268 (084.cr)" # :nocode: :example:
( "aabbcc".delete('b') ).to_s.should eq( "aacc" )

puts "# string.cr:2279 (085.cr)" # :nocode: :example:
( "aabbccdd".delete("a-c") ).to_s.should eq( "dd" )

puts "# string.cr:2291 (086.cr)" # :nocode: :example:
( "aaabbbccc".squeeze { |c| ['a', 'b'].includes?(c) } ).to_s.should eq( "abccc" )
( "aaabbbccc".squeeze { |c| ['a', 'c'].includes?(c) } ).to_s.should eq( "abbbc" )

puts "# string.cr:2307 (087.cr)" # :nocode: :example:
( "a    bbb".squeeze(' ') ).to_s.should eq( "a bbb" )

puts "# string.cr:2321 (088.cr)" # :nocode: :example:
( "aaabbbcccddd".squeeze("b-d") ).to_s.should eq( "aaabcd" )
( "a       bbb".squeeze ).to_s.should eq( "a b" )

puts "# string.cr:2332 (089.cr)" # :nocode: :example:
( "a       bbb".squeeze ).to_s.should eq( "a b" )

puts "# string.cr:2346 (090.cr)" # :nocode: :example:
( "".blank? ).should eq( true )
( "   ".blank? ).should eq( true )
( "   a   ".blank? ).should eq( false )

puts "# string.cr:2374 (091.cr)" # :nocode: :example:
( "abcdef" <=> "abcde" ).should eq( 1 )
( "abcdef" <=> "abcdef" ).should eq( 0 )
( "abcdef" <=> "abcdefg" ).should eq( -1 )
( "abcdef" <=> "ABCDEF" ).should eq( 1 )

puts "# string.cr:2396 (092.cr)" # :nocode: :example:
( "abcdef".compare("abcde") ).should eq( 1 )
( "abcdef".compare("abcdef") ).should eq( 0 )
( "abcdef".compare("abcdefg") ).should eq( -1 )
( "abcdef".compare("ABCDEF") ).should eq( 1 )

( "abcdef".compare("ABCDEF", case_insensitive: true) ).should eq( 0 )
( "abcdef".compare("ABCDEG", case_insensitive: true) ).should eq( -1 )

puts "# string.cr:2436 (093.cr)" # :nocode: :example:
( "Haystack" =~ /ay/ ).should eq( 1 )
( "Haystack" =~ /z/ ).should eq( nil )

( "Haystack" =~ 45 ).should eq( nil )

puts "# string.cr:2455 (094.cr)" # :nocode: :example:
( "abc" + "def" ).to_s.should eq( "abcdef" )
( "abc" + 'd' ).to_s.should eq( "abcd" )

puts "# string.cr:2494 (095.cr)" # :nocode: :example:
"Developers! " * 4
# => "Developers! Developers! Developers! Developers! "

puts "# string.cr:2543 (096.cr)" # :nocode: :example:
( "Hello, World".index('o') ).should eq( 4 )
( "Hello, World".index('Z') ).should eq( nil )
( "Hello, World".index("o", 5) ).should eq( 8 )
( "Hello, World".index("H", 2) ).should eq( nil )
( "Hello, World".index(/[ ]+/) ).should eq( 6 )
( "Hello, World".index(/\d+/) ).should eq( nil )

puts "# string.cr:2652 (097.cr)" # :nocode: :example:
( "Hello, World".rindex('o') ).should eq( 8 )
( "Hello, World".rindex('Z') ).should eq( nil )
( "Hello, World".rindex("o", 5) ).should eq( 4 )
( "Hello, World".rindex("W", 2) ).should eq( nil )

puts "# string.cr:2758 (098.cr)" # :nocode: :example:
( "hello".partition("l") ).should eq( {"he", "l", "lo"} )
( "hello".partition("x") ).should eq( {"hello", "", ""} )

puts "# string.cr:2797 (099.cr)" # :nocode: :example:
( "hello".rpartition("l") ).should eq( {"hel", "l", "o"} )
( "hello".rpartition("x") ).should eq( {"", "", "hello"} )
( "hello".rpartition(/.l/) ).should eq( {"he", "ll", "o"} )

puts "# string.cr:2910 (100.cr)" # :nocode: :example:
( "hello".char_index_to_byte_index(1) ).should eq( 1 )
( "hello".char_index_to_byte_index(5) ).should eq( 5 )
( "こんにちは".char_index_to_byte_index(1) ).should eq( 3 )
( "こんにちは".char_index_to_byte_index(5) ).should eq( 15 )

puts "# string.cr:2946 (101.cr)" # :nocode: :example:
( "Team".includes?('i') ).should eq( false )
( "Dysfunctional".includes?("fun") ).should eq( true )

puts "# string.cr:2960 (102.cr)" # :nocode: :example:
old_pond = "
  Old pond
  a frog leaps in
  water's sound
"
( old_pond.split ).should eq( ["Old", "pond", "a", "frog", "leaps", "in", "water's", "sound"] )
( old_pond.split(3) ).should eq( ["Old", "pond", "a frog leaps in\n  water's sound\n"] )

puts "# string.cr:2983 (103.cr)" # :nocode: :example:
ary = [] of String
old_pond = "
  Old pond
  a frog leaps in
  water's sound
"

old_pond.split { |s| ary << s }
( ary ).should eq( ["Old", "pond", "a", "frog", "leaps", "in", "water's", "sound"] )
ary.clear

old_pond.split(3) { |s| ary << s }
( ary ).should eq( ["Old", "pond", "a frog leaps in\n  water's sound\n"] )

puts "# string.cr:3058 (104.cr)" # :nocode: :example:
( "foo,,bar,baz".split(',') ).should eq( ["foo", "", "bar", "baz"] )
( "foo,,bar,baz".split(',', remove_empty: true) ).should eq( ["foo", "bar", "baz"] )
( "foo,bar,baz".split(',', 2) ).should eq( ["foo", "bar,baz"] )

puts "# string.cr:3078 (105.cr)" # :nocode: :example:
ary = [] of String

"foo,,bar,baz".split(',') { |string| ary << string }
( ary ).should eq( ["foo", "", "bar", "baz"] )
ary.clear

"foo,,bar,baz".split(',', remove_empty: true) { |string| ary << string }
( ary ).should eq( ["foo", "bar", "baz"] )
ary.clear

"foo,bar,baz".split(',', 2) { |string| ary << string }
( ary ).should eq( ["foo", "bar,baz"] )

puts "# string.cr:3131 (106.cr)" # :nocode: :example:
long_river_name = "Mississippi"
( long_river_name.split("ss") ).should eq( ["Mi", "i", "ippi"] )
( long_river_name.split("i") ).should eq( ["M", "ss", "ss", "pp", ""] )
( long_river_name.split("i", remove_empty: true) ).should eq( ["M", "ss", "ss", "pp"] )
( long_river_name.split("") ).should eq( ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"] )

puts "# string.cr:3155 (107.cr)" # :nocode: :example:
ary = [] of String
long_river_name = "Mississippi"

long_river_name.split("ss") { |s| ary << s }
( ary ).should eq( ["Mi", "i", "ippi"] )
ary.clear

long_river_name.split("i") { |s| ary << s }
( ary ).should eq( ["M", "ss", "ss", "pp", ""] )
ary.clear

long_river_name.split("i", remove_empty: true) { |s| ary << s }
( ary ).should eq( ["M", "ss", "ss", "pp"] )
ary.clear

long_river_name.split("") { |s| ary << s }
( ary ).should eq( ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"] )

puts "# string.cr:3230 (108.cr)" # :nocode: :example:
ary = [] of String
long_river_name = "Mississippi"

long_river_name.split(/s+/) { |s| ary << s }
( ary ).should eq( ["Mi", "i", "ippi"] )
ary.clear

long_river_name.split(//) { |s| ary << s }
( ary ).should eq( ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"] )

puts "# string.cr:3258 (109.cr)" # :nocode: :example:
long_river_name = "Mississippi"
( long_river_name.split(/s+/) ).should eq( ["Mi", "i", "ippi"] )
( long_river_name.split(//) ).should eq( ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"] )

puts "# string.cr:3338 (110.cr)" # :nocode: :example:
haiku = "the first cold shower
even the monkey seems to want
a little coat of straw"
haiku.each_line do |stanza|
  puts stanza.upcase
end
# => THE FIRST COLD SHOWER
# => EVEN THE MONKEY SEEMS TO WANT
# => A LITTLE COAT OF STRAW

puts "# string.cr:3379 (111.cr)" # :nocode: :example:
( "DoesWhatItSaysOnTheTin".underscore ).to_s.should eq( "does_what_it_says_on_the_tin" )
( "PartyInTheUSA".underscore ).to_s.should eq( "party_in_the_usa" )
( "HTTP_CLIENT".underscore ).to_s.should eq( "http_client" )
( "3.14IsPi".underscore ).to_s.should eq( "3.14_is_pi" )

puts "# string.cr:3451 (112.cr)" # :nocode: :example:
( "eiffel_tower".camelcase ).to_s.should eq( "EiffelTower" )

puts "# string.cr:3479 (113.cr)" # :nocode: :example:
( "Argentina".reverse ).to_s.should eq( "anitnegrA" )
( "racecar".reverse ).to_s.should eq( "racecar" )

puts "# string.cr:3510 (114.cr)" # :nocode: :example:
( "Purple".ljust(8) ).to_s.should eq( "Purple  " )
( "Purple".ljust(8, '-') ).to_s.should eq( "Purple--" )
( "Aubergine".ljust(8) ).to_s.should eq( "Aubergine" )

puts "# string.cr:3521 (115.cr)" # :nocode: :example:
( "Purple".rjust(8) ).to_s.should eq( "  Purple" )
( "Purple".rjust(8, '-') ).to_s.should eq( "--Purple" )
( "Aubergine".rjust(8) ).to_s.should eq( "Aubergine" )

puts "# string.cr:3572 (116.cr)" # :nocode: :example:
( "abcd".succ ).to_s.should eq( "abce" )
( "THX1138".succ ).to_s.should eq( "THX1139" )
( "((koala))".succ ).to_s.should eq( "((koalb))" )
( "1999zzz".succ ).to_s.should eq( "2000aaa" )
( "ZZZ9999".succ ).to_s.should eq( "AAAA0000" )
( "***".succ ).to_s.should eq( "**+" )

puts "# string.cr:3685 (117.cr)" # :nocode: :example:
array = [] of Char
"ab☃".each_char do |char|
  array << char
end
( array ).should eq( ['a', 'b', '☃'] )

puts "# string.cr:3706 (118.cr)" # :nocode: :example:
chars = "ab☃".each_char
( chars.next ).should eq( 'a' )
( chars.next ).should eq( 'b' )
( chars.next ).should eq( '☃' )

puts "# string.cr:3718 (119.cr)" # :nocode: :example:
array = [] of Tuple(Char, Int32)
"ab☃".each_char_with_index do |char, index|
  array << {char, index}
end
( array ).should eq( [{'a', 0}, {'b', 1}, {'☃', 2}] )

puts "# string.cr:3735 (120.cr)" # :nocode: :example:
( "ab☃".chars ).should eq( ['a', 'b', '☃'] )

puts "# string.cr:3748 (121.cr)" # :nocode: :example:
array = [] of Int32
"ab☃".each_codepoint do |codepoint|
  array << codepoint
end
( array ).should eq( [97, 98, 9731] )

puts "# string.cr:3765 (122.cr)" # :nocode: :example:
codepoints = "ab☃".each_codepoint
( codepoints.next ).should eq( 97 )
( codepoints.next ).should eq( 98 )
( codepoints.next ).should eq( 9731 )

puts "# string.cr:3779 (123.cr)" # :nocode: :example:
( "ab☃".codepoints ).should eq( [97, 98, 9731] )

puts "# string.cr:3794 (124.cr)" # :nocode: :example:
array = [] of UInt8
"ab☃".each_byte do |byte|
  array << byte
end
( array ).should eq( [97, 98, 226, 152, 131] )

puts "# string.cr:3810 (125.cr)" # :nocode: :example:
bytes = "ab☃".each_byte
( bytes.next ).should eq( 97 )
( bytes.next ).should eq( 98 )
( bytes.next ).should eq( 226 )
( bytes.next ).should eq( 152 )
( bytes.next ).should eq( 131 )

puts "# string.cr:3824 (126.cr)" # :nocode: :example:
( "hello".bytes ).should eq( [104, 101, 108, 108, 111] )
( "你好".bytes ).should eq( [228, 189, 160, 229, 165, 189] )

puts "# string.cr:3855 (127.cr)" # :nocode: :example:
( "\u{1f48e} - à la carte\n".inspect ).should eq( %("\u{1F48E} - à la carte\\n") )

puts "# string.cr:3871 (128.cr)" # :nocode: :example:
( "\u{1f48e} - à la carte\n".inspect_unquoted ).should eq( %(\u{1F48E} - à la carte\\n) )

puts "# string.cr:3890 (129.cr)" # :nocode: :example:
( "\u{1f48e} - à la carte\n".dump ).should eq( %("\\u{1F48E} - \\u00E0 la carte\\n") )

puts "# string.cr:3910 (130.cr)" # :nocode: :example:
( "\u{1f48e} - à la carte\n".dump_unquoted ).should eq( %(\\u{1F48E} - \\u00E0 la carte\\n) )

puts "# string.cr:4056 (131.cr)" # :nocode: :example:
( "I have %d apples" % 5 ).to_s.should eq( "I have 5 apples" )
( "%s, %s, %s, D" % ['A', 'B', 'C'] ).to_s.should eq( "A, B, C, D" )
( "sum: %{one} + %{two} = %{three}" % {one: 1, two: 2, three: 1 + 2} ).to_s.should eq( "sum: 1 + 2 = 3" )
( "I have %<apples>s apples" % {apples: 4} ).to_s.should eq( "I have 4 apples" )

puts "# string.cr:4073 (132.cr)" # :nocode: :example:
( "hello".size ).should eq( 5 )
( "你好".size ).should eq( 2 )

puts "# string.cr:4088 (133.cr)" # :nocode: :example:
( "hello".ascii_only? ).should eq( true )
( "你好".ascii_only? ).should eq( false )


end
