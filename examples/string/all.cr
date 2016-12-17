# string.cr: 133 examples

# string.cr:9 (001.cr)
"hello world"

# string.cr:15 (002.cr)
"\"" # double quote
"\\" # backslash
"\e" # escape
"\f" # form feed
"\n" # newline
"\r" # carriage return
"\t" # tab
"\v" # vertical tab

# string.cr:28 (003.cr)
"\u0041" # == "A"

# string.cr:34 (004.cr)
"\u{41}" # == "A"

# string.cr:40 (005.cr)
"hello
      world" # same as "hello\n      world"

# string.cr:49 (006.cr)
"hello " \
"world, " \
"no newlines" # same as "hello world, no newlines"

# string.cr:57 (007.cr)
"hello \
     world, \
     no newlines" # same as "hello world, no newlines"

# string.cr:68 (008.cr)
# Supports double quotes and nested parentheses
%(hello ("world")) # same as "hello (\"world\")"

# Supports double quotes and nested brackets
%[hello ["world"]] # same as "hello [\"world\"]"

# Supports double quotes and nested curlies
%{hello {"world"}} # same as "hello {\"world\"}"

# Supports double quotes and nested angles
%<hello <"world">> # same as "hello <\"world\">"

# string.cr:84 (009.cr)
a = 1
b = 2
"sum = #{a + b}" # "sum = 3"

# string.cr:103 (010.cr)
# here 255 is not a valid byte value in the UTF-8 encoding
string = String.new(Bytes[255, 97])
string.valid_encoding? # => false

# The first char here is the unicode replacement char
string.chars # => ['�', 'a']

# string.cr:115 (011.cr)
# Octal escape sequences
"\101" # # => "A"
"\12"  # # => "\n"
"\1"   # string with one character with code point 1
"\377" # string with one byte with value 255

# Hexadecimal escape sequences
"\x41" # # => "A"
"\xFF" # string with one byte with value 255

# string.cr:150 (012.cr)
slice = Slice.new(4) { |i| ('a'.ord + i).to_u8 }
String.new(slice) # => "abcd"

# string.cr:164 (013.cr)
slice = Slice.new(2, 0_u8)
slice[0] = 186_u8
slice[1] = 195_u8
String.new(slice, "GB2312") # => "好"

# string.cr:186 (014.cr)
ptr = Pointer.malloc(5) { |i| i == 4 ? 0_u8 : ('a'.ord + i).to_u8 }
String.new(ptr) # => "abcd"

# string.cr:201 (015.cr)
ptr = Pointer.malloc(4) { |i| ('a'.ord + i).to_u8 }
String.new(ptr, 2) # => "ab"

# string.cr:225 (016.cr)
str = String.new(4) do |buffer|
  buffer[0] = 'a'.ord.to_u8
  buffer[1] = 'b'.ord.to_u8
  {2, 2}
end
str # => "ab"

# string.cr:260 (017.cr)
str = String.build do |str|
  str << "hello "
  str << 1
end
str # => "hello 1"

# string.cr:275 (018.cr)
"hello".bytesize # => 5
"你好".bytesize    # => 6

# string.cr:295 (019.cr)
"12345".to_i             # => 12345
# "0a".to_i                # raises ArgumentError
# "hello".to_i             # raises ArgumentError
"0a".to_i(16)            # => 10
"1100101".to_i(2)        # => 101
"1100101".to_i(8)        # => 294977
"1100101".to_i(10)       # => 1100101
"1100101".to_i(base: 16) # => 17826049

# "12_345".to_i                   # raises ArgumentError
"12_345".to_i(underscore: true) # => 12345

"  12345  ".to_i                    # => 12345
# "  12345  ".to_i(whitespace: false) # raises ArgumentError

# "0x123abc".to_i               # raises ArgumentError
"0x123abc".to_i(prefix: true) # => 1194684

# "99 red balloons".to_i                # raises ArgumentError
"99 red balloons".to_i(strict: false) # => 99

# string.cr:324 (020.cr)
"12345".to_i?             # => 12345
"99 red balloons".to_i?   # => nil
"0a".to_i?(strict: false) # => 0
"hello".to_i?             # => nil

# string.cr:337 (021.cr)
"12345".to_i { 0 } # => 12345
"hello".to_i { 0 } # => 0

# string.cr:621 (022.cr)
"123.45e1".to_f                # => 1234.5
# "45.67 degrees".to_f           # raises ArgumentError
# "thx1138".to_f(strict: false)  # raises ArgumentError
# " 1.2".to_f(whitespace: false) # raises ArgumentError
"1.2foo".to_f(strict: false)   # => 1.2

# string.cr:639 (023.cr)
"123.45e1".to_f?                # => 1234.5
"45.67 degrees".to_f?           # => nil
"thx1138".to_f?                 # => nil
" 1.2".to_f?(whitespace: false) # => nil
"1.2foo".to_f?(strict: false)   # => 1.2

# string.cr:709 (024.cr)
"hello"[0]  # 'h'
"hello"[1]  # 'e'
"hello"[-1] # 'o'
"hello"[-2] # 'l'
# "hello"[5]  # raises IndexError

# string.cr:726 (025.cr)
"hello"[0..2]   # "hel"
"hello"[0...2]  # "he"
"hello"[1..-1]  # "ello"
"hello"[1...-1] # "ell"

# string.cr:910 (026.cr)
"hEllO".downcase # => "hello"

# string.cr:937 (027.cr)
"hEllO".upcase # => "HELLO"

# string.cr:964 (028.cr)
"hEllO".capitalize # => "Hello"

# string.cr:997 (029.cr)
"string\r\n".chomp # => "string"
"string\n\r".chomp # => "string\n"
"string\n".chomp   # => "string"
"string".chomp     # => "string"
"x".chomp.chomp    # => "x"

# string.cr:1024 (030.cr)
"hello".chomp('o') # => "hell"
"hello".chomp('a') # => "hello"

# string.cr:1041 (031.cr)
"hello".chomp("llo") # => "he"
"hello".chomp("ol")  # => "hello"

# string.cr:1058 (032.cr)
"hello".lchop # => "ello"
"".lchop      # => ""

# string.cr:1071 (033.cr)
"hello".lchop('h') # => "ello"
"hello".lchop('g') # => "hello"

# string.cr:1085 (034.cr)
"hello".lchop("hel") # => "lo"
"hello".lchop("eh")  # => "hello"

# string.cr:1100 (035.cr)
"string\r\n".rchop # => "string\r"
"string\n\r".rchop # => "string\n"
"string\n".rchop   # => "string"
"string".rchop     # => "strin"
"x".rchop.rchop    # => ""

# string.cr:1119 (036.cr)
"string".rchop('g') # => "strin"
"string".rchop('x') # => "string"

# string.cr:1135 (037.cr)
"string".rchop("ing") # => "str"
"string".rchop("inx") # => "string"

# string.cr:1155 (038.cr)
"好".encode("GB2312") # => Bytes[186, 195]
"好".bytes            # => [229, 165, 189]

# string.cr:1192 (039.cr)
"0102031aff".hexbytes  # => Bytes[1, 2, 3, 26, 255]
# "1".hexbytes           # raises ArgumentError
# "hello world".hexbytes # raises ArgumentError

# string.cr:1207 (040.cr)
"0102031aff".hexbytes?  # => Bytes[1, 2, 3, 26, 255]
"1".hexbytes?           # => nil
"hello world".hexbytes? # => nil

# string.cr:1236 (041.cr)
"abcd".insert(0, 'X')  # => "Xabcd"
"abcd".insert(3, 'X')  # => "abcXd"
"abcd".insert(4, 'X')  # => "abcdX"
"abcd".insert(-3, 'X') # => "abXcd"
"abcd".insert(-1, 'X') # => "abcdX"

# "abcd".insert(5, 'X')  # raises IndexError
# "abcd".insert(-6, 'X') # raises IndexError

# string.cr:1267 (042.cr)
"abcd".insert(0, "FOO")  # => "FOOabcd"
"abcd".insert(3, "FOO")  # => "abcFOOd"
"abcd".insert(4, "FOO")  # => "abcdFOO"
"abcd".insert(-3, "FOO") # => "abFOOcd"
"abcd".insert(-1, "FOO") # => "abcdFOO"

# "abcd".insert(5, "FOO")  # raises IndexError
# "abcd".insert(-6, "FOO") # raises IndexError

# string.cr:1303 (043.cr)
"    hello    ".strip # => "hello"
"\tgoodbye\r\n".strip # => "goodbye"

# string.cr:1319 (044.cr)
"aaabcdaaa".strip('a') # => "bcd"

# string.cr:1338 (045.cr)
"abcdefcba".strip("abc") # => "def"

# string.cr:1363 (046.cr)
"bcadefcba".strip { |c| 'a' <= c <= 'c' } # => "def"

# string.cr:1380 (047.cr)
"    hello    ".rstrip # => "    hello"
"\tgoodbye\r\n".rstrip # => "\tgoodbye"

# string.cr:1390 (048.cr)
"aaabcdaaa".rstrip('a') # => "aaabcd"

# string.cr:1403 (049.cr)
"abcdefcba".rstrip("abc") # => "abcdef"

# string.cr:1422 (050.cr)
"bcadefcba".rstrip { |c| 'a' <= c <= 'c' } # => "bcadef"

# string.cr:1434 (051.cr)
"    hello    ".lstrip # => "hello    "
"\tgoodbye\r\n".lstrip # => "goodbye\r\n"

# string.cr:1444 (052.cr)
"aaabcdaaa".lstrip('a') # => "bcdaaa"

# string.cr:1457 (053.cr)
"bcadefcba".lstrip("abc") # => "defcba"

# string.cr:1476 (054.cr)
"bcadefcba".lstrip { |c| 'a' <= c <= 'c' } # => "defcba"

# string.cr:1585 (055.cr)
"aabbcc".tr("abc", "xyz") # => "xxyyzz"
"aabbcc".tr("abc", "x")   # => "xxxxxx"
"aabbcc".tr("a", "xyz")   # => "xxbbcc"

# string.cr:1638 (056.cr)
"hello".sub { |char| char + 1 } # => "iello"
"hello".sub { "hi" }            # => "hiello"

# string.cr:1656 (057.cr)
"hello".sub('l', "lo")      # => "helolo"
"hello world".sub('o', 'a') # => "hella world"

# string.cr:1684 (058.cr)
"hello".sub(/./) { |s| s[0].ord.to_s + ' ' } # => "104 ello"

# string.cr:1697 (059.cr)
"hello".sub(/[aeiou]/, "*") # => "h*llo"

# string.cr:1706 (060.cr)
"hello".sub(/[aeiou]/, "(\\0)") # => "h(e)llo"

# string.cr:1721 (061.cr)
"foo".sub(/o/, "x\\0x")                  # => "fxoxo"
"foofoo".sub(/(?<bar>oo)/, "|\\k<bar>|") # => "f|oo|foo"
"foo".sub(/o/, "\\\\0")                  # => "f\\0o"

# string.cr:1744 (062.cr)
"hello".sub(/(he|l|o)/, {"he": "ha", "l": "la"}) # => "hallo"
"hello".sub(/(he|l|o)/, {"l": "la"})             # => "hello"

# string.cr:1761 (063.cr)
"hello yellow".sub("ll", "dd") # => "heddo yellow"

# string.cr:1771 (064.cr)
"hello yellow".sub("ll") { "dd" } # => "heddo yellow"

# string.cr:1788 (065.cr)
"hello".sub({'a' => 'b', 'l' => 'd'}) # => "hedlo"

# string.cr:1832 (066.cr)
"hello".sub(1, 'a') # => "hallo"

# string.cr:1848 (067.cr)
"hello".sub(1, "eee") # => "heeello"

# string.cr:1882 (068.cr)
"hello".sub(1..2, 'a') # => "halo"

# string.cr:1898 (069.cr)
"hello".sub(1..2, "eee") # => "heeelo"

# string.cr:1992 (070.cr)
"hello".gsub { |char| char + 1 } # => "ifmmp"
"hello".gsub { "hi" }            # => "hihihihihi"

# string.cr:2007 (071.cr)
"hello".gsub('l', "lo")      # => "heloloo"
"hello world".gsub('o', 'a') # => "hella warld"

# string.cr:2043 (072.cr)
"hello".gsub(/./) { |s| s[0].ord.to_s + ' ' } # => "104 101 108 108 111 "

# string.cr:2056 (073.cr)
"hello".gsub(/[aeiou]/, '*') # => "h*ll*"

# string.cr:2065 (074.cr)
"hello".gsub(/[aeiou]/, "(\\0)") # => "h(e)ll(o)"

# string.cr:2080 (075.cr)
"foo".gsub(/o/, "x\\0x")                  # => "fxoxxox"
"foofoo".gsub(/(?<bar>oo)/, "|\\k<bar>|") # => "f|oo|f|oo|"
"foo".gsub(/o/, "\\\\0")                  # => "f\\0\\0"

# string.cr:2104 (076.cr)
# "he" and "l" are matched and replaced,
# but "o" is not and so is not included
"hello".gsub(/(he|l|o)/, {"he": "ha", "l": "la"}) # => "halala"

# string.cr:2118 (077.cr)
"hello yellow".gsub("ll", "dd") # => "heddo yeddow"

# string.cr:2132 (078.cr)
"hello yellow".gsub("ll") { "dd" } # => "heddo yeddow"

# string.cr:2167 (079.cr)
"hello".gsub({'e' => 'a', 'l' => 'd'}) # => "haddo"

# string.cr:2179 (080.cr)
"hello".gsub({e: 'a', l: 'd'}) # => "haddo"

# string.cr:2224 (081.cr)
"aabbcc".count { |c| ['a', 'b'].includes?(c) } # => 4

# string.cr:2237 (082.cr)
"aabbcc".count('a') # => 2

# string.cr:2255 (083.cr)
"aabbcc".delete { |c| ['a', 'b'].includes?(c) } # => "cc"

# string.cr:2268 (084.cr)
"aabbcc".delete('b') # => "aacc"

# string.cr:2279 (085.cr)
"aabbccdd".delete("a-c") # => "dd"

# string.cr:2291 (086.cr)
"aaabbbccc".squeeze { |c| ['a', 'b'].includes?(c) } # => "abccc"
"aaabbbccc".squeeze { |c| ['a', 'c'].includes?(c) } # => "abbbc"

# string.cr:2307 (087.cr)
"a    bbb".squeeze(' ') # => "a bbb"

# string.cr:2321 (088.cr)
"aaabbbcccddd".squeeze("b-d") # => "aaabcd"
"a       bbb".squeeze         # => "a b"

# string.cr:2332 (089.cr)
"a       bbb".squeeze # => "a b"

# string.cr:2346 (090.cr)
"".blank?        # => true
"   ".blank?     # => true
"   a   ".blank? # => false

# string.cr:2374 (091.cr)
"abcdef" <=> "abcde"   # => 1
"abcdef" <=> "abcdef"  # => 0
"abcdef" <=> "abcdefg" # => -1
"abcdef" <=> "ABCDEF"  # => 1

# string.cr:2396 (092.cr)
"abcdef".compare("abcde")   # => 1
"abcdef".compare("abcdef")  # => 0
"abcdef".compare("abcdefg") # => -1
"abcdef".compare("ABCDEF")  # => 1

"abcdef".compare("ABCDEF", case_insensitive: true) # => 0
"abcdef".compare("ABCDEG", case_insensitive: true) # => -1

# string.cr:2436 (093.cr)
"Haystack" =~ /ay/ # => 1
"Haystack" =~ /z/  # => nil

"Haystack" =~ 45 # => nil

# string.cr:2455 (094.cr)
"abc" + "def" # => "abcdef"
"abc" + 'd'   # => "abcd"

# string.cr:2494 (095.cr)
"Developers! " * 4
# => "Developers! Developers! Developers! Developers! "

# string.cr:2543 (096.cr)
"Hello, World".index('o')    # => 4
"Hello, World".index('Z')    # => nil
"Hello, World".index("o", 5) # => 8
"Hello, World".index("H", 2) # => nil
"Hello, World".index(/[ ]+/) # => 6
"Hello, World".index(/\d+/)  # => nil

# string.cr:2652 (097.cr)
"Hello, World".rindex('o')    # => 8
"Hello, World".rindex('Z')    # => nil
"Hello, World".rindex("o", 5) # => 4
"Hello, World".rindex("W", 2) # => nil

# string.cr:2758 (098.cr)
"hello".partition("l") # => {"he", "l", "lo"}
"hello".partition("x") # => {"hello", "", ""}

# string.cr:2797 (099.cr)
"hello".rpartition("l")  # => {"hel", "l", "o"}
"hello".rpartition("x")  # => {"", "", "hello"}
"hello".rpartition(/.l/) # => {"he", "ll", "o"}

# string.cr:2910 (100.cr)
"hello".char_index_to_byte_index(1) # => 1
"hello".char_index_to_byte_index(5) # => 5
"こんにちは".char_index_to_byte_index(1) # => 3
"こんにちは".char_index_to_byte_index(5) # => 15

# string.cr:2946 (101.cr)
"Team".includes?('i')            # => false
"Dysfunctional".includes?("fun") # => true

# string.cr:2960 (102.cr)
old_pond = "
  Old pond
  a frog leaps in
  water's sound
"
old_pond.split    # => ["Old", "pond", "a", "frog", "leaps", "in", "water's", "sound"]
old_pond.split(3) # => ["Old", "pond", "a frog leaps in\n  water's sound\n"]

# string.cr:2983 (103.cr)
ary = [] of String
old_pond = "
  Old pond
  a frog leaps in
  water's sound
"

old_pond.split { |s| ary << s }
ary # => ["Old", "pond", "a", "frog", "leaps", "in", "water's", "sound"]
ary.clear

old_pond.split(3) { |s| ary << s }
ary # => ["Old", "pond", "a frog leaps in\n  water's sound\n"]

# string.cr:3058 (104.cr)
"foo,,bar,baz".split(',')                     # => ["foo", "", "bar", "baz"]
"foo,,bar,baz".split(',', remove_empty: true) # => ["foo", "bar", "baz"]
"foo,bar,baz".split(',', 2)                   # => ["foo", "bar,baz"]

# string.cr:3078 (105.cr)
ary = [] of String

"foo,,bar,baz".split(',') { |string| ary << string }
ary # => ["foo", "", "bar", "baz"]
ary.clear

"foo,,bar,baz".split(',', remove_empty: true) { |string| ary << string }
ary # => ["foo", "bar", "baz"]
ary.clear

"foo,bar,baz".split(',', 2) { |string| ary << string }
ary # => ["foo", "bar,baz"]

# string.cr:3131 (106.cr)
long_river_name = "Mississippi"
long_river_name.split("ss")                    # => ["Mi", "i", "ippi"]
long_river_name.split("i")                     # => ["M", "ss", "ss", "pp", ""]
long_river_name.split("i", remove_empty: true) # => ["M", "ss", "ss", "pp"]
long_river_name.split("")                      # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]

# string.cr:3155 (107.cr)
ary = [] of String
long_river_name = "Mississippi"

long_river_name.split("ss") { |s| ary << s }
ary # => ["Mi", "i", "ippi"]
ary.clear

long_river_name.split("i") { |s| ary << s }
ary # => ["M", "ss", "ss", "pp", ""]
ary.clear

long_river_name.split("i", remove_empty: true) { |s| ary << s }
ary # => ["M", "ss", "ss", "pp"]
ary.clear

long_river_name.split("") { |s| ary << s }
ary # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]

# string.cr:3230 (108.cr)
ary = [] of String
long_river_name = "Mississippi"

long_river_name.split(/s+/) { |s| ary << s }
ary # => ["Mi", "i", "ippi"]
ary.clear

long_river_name.split(//) { |s| ary << s }
ary # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]

# string.cr:3258 (109.cr)
long_river_name = "Mississippi"
long_river_name.split(/s+/) # => ["Mi", "i", "ippi"]
long_river_name.split(//)   # => ["M", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"]

# string.cr:3338 (110.cr)
haiku = "the first cold shower
even the monkey seems to want
a little coat of straw"
haiku.each_line do |stanza|
  puts stanza.upcase
end
# => THE FIRST COLD SHOWER
# => EVEN THE MONKEY SEEMS TO WANT
# => A LITTLE COAT OF STRAW

# string.cr:3379 (111.cr)
"DoesWhatItSaysOnTheTin".underscore # => "does_what_it_says_on_the_tin"
"PartyInTheUSA".underscore          # => "party_in_the_usa"
"HTTP_CLIENT".underscore            # => "http_client"
"3.14IsPi".underscore               # => "3.14_is_pi"

# string.cr:3451 (112.cr)
"eiffel_tower".camelcase # => "EiffelTower"

# string.cr:3479 (113.cr)
"Argentina".reverse # => "anitnegrA"
"racecar".reverse   # => "racecar"

# string.cr:3510 (114.cr)
"Purple".ljust(8)      # => "Purple  "
"Purple".ljust(8, '-') # => "Purple--"
"Aubergine".ljust(8)   # => "Aubergine"

# string.cr:3521 (115.cr)
"Purple".rjust(8)      # => "  Purple"
"Purple".rjust(8, '-') # => "--Purple"
"Aubergine".rjust(8)   # => "Aubergine"

# string.cr:3572 (116.cr)
"abcd".succ      # => "abce"
"THX1138".succ   # => "THX1139"
"((koala))".succ # => "((koalb))"
"1999zzz".succ   # => "2000aaa"
"ZZZ9999".succ   # => "AAAA0000"
"***".succ       # => "**+"

# string.cr:3685 (117.cr)
array = [] of Char
"ab☃".each_char do |char|
  array << char
end
array # => ['a', 'b', '☃']

# string.cr:3706 (118.cr)
chars = "ab☃".each_char
chars.next # => 'a'
chars.next # => 'b'
chars.next # => '☃'

# string.cr:3718 (119.cr)
array = [] of Tuple(Char, Int32)
"ab☃".each_char_with_index do |char, index|
  array << {char, index}
end
array # => [{'a', 0}, {'b', 1}, {'☃', 2}]

# string.cr:3735 (120.cr)
"ab☃".chars # => ['a', 'b', '☃']

# string.cr:3748 (121.cr)
array = [] of Int32
"ab☃".each_codepoint do |codepoint|
  array << codepoint
end
array # => [97, 98, 9731]

# string.cr:3765 (122.cr)
codepoints = "ab☃".each_codepoint
codepoints.next # => 97
codepoints.next # => 98
codepoints.next # => 9731

# string.cr:3779 (123.cr)
"ab☃".codepoints # => [97, 98, 9731]

# string.cr:3794 (124.cr)
array = [] of UInt8
"ab☃".each_byte do |byte|
  array << byte
end
array # => [97, 98, 226, 152, 131]

# string.cr:3810 (125.cr)
bytes = "ab☃".each_byte
bytes.next # => 97
bytes.next # => 98
bytes.next # => 226
bytes.next # => 152
bytes.next # => 131

# string.cr:3824 (126.cr)
"hello".bytes # => [104, 101, 108, 108, 111]
"你好".bytes    # => [228, 189, 160, 229, 165, 189]

# string.cr:3855 (127.cr)
"\u{1f48e} - à la carte\n".inspect # => %("\u{1F48E} - à la carte\\n")

# string.cr:3871 (128.cr)
"\u{1f48e} - à la carte\n".inspect_unquoted # => %(\u{1F48E} - à la carte\\n)

# string.cr:3890 (129.cr)
"\u{1f48e} - à la carte\n".dump # => %("\\u{1F48E} - \\u00E0 la carte\\n")

# string.cr:3910 (130.cr)
"\u{1f48e} - à la carte\n".dump_unquoted # => %(\\u{1F48E} - \\u00E0 la carte\\n)

# string.cr:4056 (131.cr)
"I have %d apples" % 5                                             # => "I have 5 apples"
"%s, %s, %s, D" % ['A', 'B', 'C']                                  # => "A, B, C, D"
"sum: %{one} + %{two} = %{three}" % {one: 1, two: 2, three: 1 + 2} # => "sum: 1 + 2 = 3"
"I have %<apples>s apples" % {apples: 4}                           # => "I have 4 apples"

# string.cr:4073 (132.cr)
"hello".size # => 5
"你好".size    # => 2

# string.cr:4088 (133.cr)
"hello".ascii_only? # => true
"你好".ascii_only?    # => false
