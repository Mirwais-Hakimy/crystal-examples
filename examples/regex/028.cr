# regex.cr:472
/(.)(.)(.)/.match_at_byte_index("abc").try &.[2]   # => "b"
/(.)(.)/.match_at_byte_index("abc", 1).try &.[2]   # => "c"
/(.)(.)/.match_at_byte_index("クリスタル", 3).try &.[2] # => "ス"
