# kernel.cr: 19 examples

# kernel.cr:50 (001.cr)
puts ARGF.gets_to_end

# kernel.cr:78 (002.cr)
ARGV.replace ["file1"]
ARGF.gets_to_end # => Content of file1
ARGV             # => []
ARGV << "file2"
ARGF.gets_to_end # => Content of file2

# kernel.cr:89 (003.cr)
loop do
  line = gets
  break unless line
  # ...
end

# kernel.cr:226 (004.cr)
sprintf "%d", 123  # => "123"
sprintf "%+d", 123 # => "+123"
sprintf "% d", 123 # => " 123"

# kernel.cr:233 (005.cr)
sprintf "%o", 123   # => "173"
sprintf "%+o", 123  # => "+173"
sprintf "%o", -123  # => "-173"
sprintf "%+o", -123 # => "-173"

# kernel.cr:241 (006.cr)
sprintf "%x", 123   # => "7b"
sprintf "%+x", 123  # => "+7b"
sprintf "%x", -123  # => "-7b"
sprintf "%+x", -123 # => "-7b"
sprintf "%#x", 0    # => "0"
sprintf "% x", 123  # => " 7b"
sprintf "% x", -123 # => "-7b"
sprintf "%X", 123   # => "7B"
sprintf "%#X", -123 # => "-7B"

# kernel.cr:254 (007.cr)
sprintf "%b", 123    # => "1111011"
sprintf "%+b", 123   # => "+1111011"
sprintf "%+b", -123  # => "-1111011"
sprintf "%b", -123   # => "-1111011"
sprintf "%#b", 0     # => "0"
sprintf "% b", 123   # => " 1111011"
sprintf "%+ b", 123  # => "+ 1111011"
sprintf "% b", -123  # => "-1111011"
sprintf "%+ b", -123 # => "-1111011"

# kernel.cr:267 (008.cr)
sprintf "%a", 123 # => "0x1.ecp+6"
sprintf "%A", 123 # => "0X1.ECP+6"

# kernel.cr:273 (009.cr)
sprintf "%g", 123.4          # => "123.4"
sprintf "%g", 123.4567       # => "123.457"
sprintf "%20.8g", 1234.56789 # => "           1234.5679"
sprintf "%20.8g", 123456789  # => "       1.2345679e+08"
sprintf "%20.8G", 123456789  # => "       1.2345679E+08"
sprintf "%20.8g", -123456789 # => "       -1.2345679e+08"
sprintf "%20.8G", -123456789 # => "       -1.2345679E+08"

# kernel.cr:288 (010.cr)
sprintf "%20d", 123   # => "                 123"
sprintf "%+20d", 123  # => "                +123"
sprintf "%020d", 123  # => "00000000000000000123"
sprintf "%+020d", 12  # => "+0000000000000000123"
sprintf "% 020d", 123 # => " 0000000000000000123"
sprintf "%-20d", 123  # => "123                 "
sprintf "%-+20d", 123 # => "+123                "
sprintf "%- 20d", 123 # => " 123                "
sprintf "%020x", -123 # => "00000000000000000-7b"
sprintf "%020X", -123 # => "00000000000000000-7B"

# kernel.cr:311 (011.cr)
sprintf "%20.8d", 123   # => "                 123"
sprintf "%020.8d", 123  # => "00000000000000000123"
sprintf "%20.8o", 123   # => "                 173"
sprintf "%020.8o", 123  # => "00000000000000000173"
sprintf "%20.8x", 123   # => "                  7b"
sprintf "%020.8x", 123  # => "0000000000000000007b"
sprintf "%20.8b", 123   # => "            01111011"
sprintf "%20.8d", -123  # => "                -123"
sprintf "%020.8d", -123 # => "0000000000000000-123"
sprintf "%20.8o", -123  # => "                -173"
sprintf "%20.8x", -123  # => "                 -7b"
sprintf "%20.8b", -11   # => "               -1011"

# kernel.cr:327 (012.cr)
sprintf "%20.8e", 1234.56789 # => "      1.23456789e+03"

# kernel.cr:332 (013.cr)
sprintf "%20.8f", 1234.56789 # => "       1234.56789000"

# kernel.cr:337 (014.cr)
sprintf "%20.8g", 1234.56789 # => "           1234.5679"
sprintf "%20.8g", 123456789  # => "       1.2345679e+08"
sprintf "%-20.8g", 123456789 # => "1.2345679e+08       "

# kernel.cr:344 (015.cr)
sprintf "%20.8s", "string test" # => "            string t"

# kernel.cr:349 (016.cr)
sprintf "%d %04x", 123, 123             # => "123 007b"
sprintf "%08b '%4s'", 123, 123          # => "01111011 ' 123'"
sprintf "%+g:% g:%-g", 1.23, 1.23, 1.23 # => "+1.23: 1.23:1.23"

# kernel.cr:396 (017.cr)
p foo: 23, bar: 42 # => {foo: 23, bar: 42}

# kernel.cr:429 (018.cr)
p foo: 23, bar: 42 # => {foo: 23, bar: 42}

# kernel.cr:483 (019.cr)
def do_at_exit(str1)
  at_exit { print str1 }
end

at_exit { puts "cruel world" }
do_at_exit("goodbye ")
exit
