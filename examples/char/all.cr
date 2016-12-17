# char.cr: 40 examples

# char.cr:8 (001.cr)
'a'
'z'
'0'
'_'
'あ'

# char.cr:18 (002.cr)
'\'' # single quote
'\\' # backslash
'\e' # escape
'\f' # form feed
'\n' # newline
'\r' # carriage return
'\t' # tab
'\v' # vertical tab

# char.cr:31 (003.cr)
'\u0041' # == 'A'

# char.cr:37 (004.cr)
'\u{41}' # == 'A'

# char.cr:57 (005.cr)
'a' - 'a' # => 0
'b' - 'a' # => 1
'c' - 'a' # => 2

# char.cr:68 (006.cr)
'f' + "oo" # => "foo"

# char.cr:88 (007.cr)
'a' + 1 # => 'b'
'a' + 2 # => 'c'

# char.cr:98 (008.cr)
'c' - 1 # => 'b'
'c' - 2 # => 'a'

# char.cr:108 (009.cr)
'a' <=> 'c' # => -2

# char.cr:125 (010.cr)
'4'.ascii_number?     # => true
'z'.ascii_number?     # => false
'z'.ascii_number?(36) # => true

# char.cr:136 (011.cr)
'1'.number? # => true
'a'.number? # => false

# char.cr:146 (012.cr)
'c'.ascii_lowercase? # => true
'ç'.lowercase?       # => true
'G'.ascii_lowercase? # => false
'.'.ascii_lowercase? # => false

# char.cr:158 (013.cr)
'c'.lowercase? # => true
'ç'.lowercase? # => true
'G'.lowercase? # => false
'.'.lowercase? # => false

# char.cr:170 (014.cr)
'H'.ascii_uppercase? # => true
'Á'.ascii_uppercase? # => false
'c'.ascii_uppercase? # => false
'.'.ascii_uppercase? # => false

# char.cr:182 (015.cr)
'H'.uppercase? # => true
'Á'.uppercase? # => true
'c'.uppercase? # => false
'.'.uppercase? # => false

# char.cr:194 (016.cr)
'c'.ascii_letter? # => true
'á'.ascii_letter? # => false
'8'.ascii_letter? # => false

# char.cr:205 (017.cr)
'c'.letter? # => true
'á'.letter? # => true
'8'.letter? # => false

# char.cr:216 (018.cr)
'c'.ascii_alphanumeric? # => true
'8'.ascii_alphanumeric? # => true
'.'.ascii_alphanumeric? # => false

# char.cr:227 (019.cr)
'c'.alphanumeric? # => true
'8'.alphanumeric? # => true
'.'.alphanumeric? # => false

# char.cr:238 (020.cr)
' '.ascii_whitespace?  # => true
'\t'.ascii_whitespace? # => true
'b'.ascii_whitespace?  # => false

# char.cr:249 (021.cr)
' '.whitespace?  # => true
'\t'.whitespace? # => true
'b'.whitespace?  # => false

# char.cr:260 (022.cr)
'5'.hex? # => true
'a'.hex? # => true
'F'.hex? # => true
'g'.hex? # => false

# char.cr:284 (023.cr)
'l'.in_set? "lo"          # => true
'l'.in_set? "lo", "o"     # => false
'l'.in_set? "hello", "^l" # => false
'l'.in_set? "j-m"         # => true

'^'.in_set? "\\^aeiou" # => true
'-'.in_set? "a\\-eo"   # => true

'\\'.in_set? "\\"    # => true
'\\'.in_set? "\\A"   # => false
'\\'.in_set? "X-\\w" # => true

# char.cr:358 (024.cr)
'Z'.downcase # => 'z'
'x'.downcase # => 'x'
'.'.downcase # => '.'

# char.cr:385 (025.cr)
'z'.upcase # => 'Z'
'X'.upcase # => 'X'
'.'.upcase # => '.'

# char.cr:400 (026.cr)
'z'.upcase { |v| puts v } # prints 'Z'
'ﬄ'.upcase { |v| puts v } # prints 'F', 'F', 'L'

# char.cr:415 (027.cr)
'a'.succ # => 'b'
'あ'.succ # => 'ぃ'

# char.cr:427 (028.cr)
'b'.pred # => 'a'
'ぃ'.pred # => 'あ'

# char.cr:437 (029.cr)
('\u0000'..'\u0019').each do |char|
  char.control? # => true
end

('\u007F'..'\u009F').each do |char|
  char.control? # => true
end

# char.cr:462 (030.cr)
'a'.inspect      # => "'a'"
'\t'.inspect     # => "'\\t'"
'あ'.inspect      # => "'あ'"
'\u0012'.inspect # => "'\\u{12}'"

# char.cr:490 (031.cr)
'a'.dump      # => "'a'"
'\t'.dump     # => "'\\t'"
'あ'.dump      # => "'\\u{3042}'"
'\u0012'.dump # => "'\\u{12}'"

# char.cr:541 (032.cr)
'1'.to_i     # => 1
'8'.to_i     # => 8
# 'c'.to_i     # raises ArgumentError
'1'.to_i(16) # => 1
'a'.to_i(16) # => 10
'f'.to_i(16) # => 15
# 'z'.to_i(16) # raises ArgumentError

# char.cr:557 (033.cr)
'1'.to_i?     # => 1
'8'.to_i?     # => 8
'c'.to_i?     # => nil
'1'.to_i?(16) # => 1
'a'.to_i?(16) # => 10
'f'.to_i?(16) # => 15
'z'.to_i?(16) # => nil

# char.cr:607 (034.cr)
'1'.to_f # => 1.0
'8'.to_f # => 8.0
# 'c'.to_f # raises ArgumentError

# char.cr:619 (035.cr)
'1'.to_f? # => 1.0
'8'.to_f? # => 8.0
'c'.to_f? # => nil

# char.cr:650 (036.cr)
puts "'a'"
'a'.each_byte do |byte|
  puts byte
end
puts

puts "'あ'"
'あ'.each_byte do |byte|
  puts byte
end

# char.cr:703 (037.cr)
'a'.bytesize # => 1
'好'.bytesize # => 3

# char.cr:730 (038.cr)
'a'.bytes # => [97]
'あ'.bytes # => [227, 129, 130]

# char.cr:744 (039.cr)
'a'.to_s # => "a"
'あ'.to_s # => "あ"

# char.cr:782 (040.cr)
'c'.ord       # => 99
'c' === 99_u8 # => true
'c' === 99    # => true
'z' === 99    # => false
