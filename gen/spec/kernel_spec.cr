require "spec"

puts "# kernel.cr:50 (001.cr)" # :nocode: :example:
puts ARGF.gets_to_end

puts "# kernel.cr:78 (002.cr)" # :nocode: :example:
ARGV.replace ["file1"]
( ARGF.gets_to_end ).should eq( Content of file1 )
( ARGV ).to_s.should eq( "[]" )
ARGV << "file2"
( ARGF.gets_to_end ).should eq( Content of file2 )

puts "# kernel.cr:89 (003.cr)" # :nocode: :example:
loop do
  line = gets
  break unless line
  # ...
end

puts "# kernel.cr:226 (004.cr)" # :nocode: :example:
( sprintf "%d", 123 ).to_s.should eq( "123" )
( sprintf "%+d", 123 ).to_s.should eq( "+123" )
( sprintf "% d", 123 ).to_s.should eq( " 123" )

puts "# kernel.cr:233 (005.cr)" # :nocode: :example:
( sprintf "%o", 123 ).to_s.should eq( "173" )
( sprintf "%+o", 123 ).to_s.should eq( "+173" )
( sprintf "%o", -123 ).to_s.should eq( "-173" )
( sprintf "%+o", -123 ).to_s.should eq( "-173" )

puts "# kernel.cr:241 (006.cr)" # :nocode: :example:
( sprintf "%x", 123 ).to_s.should eq( "7b" )
( sprintf "%+x", 123 ).to_s.should eq( "+7b" )
( sprintf "%x", -123 ).to_s.should eq( "-7b" )
( sprintf "%+x", -123 ).to_s.should eq( "-7b" )
( sprintf "%#x", 0 ).to_s.should eq( "0" )
( sprintf "% x", 123 ).to_s.should eq( " 7b" )
( sprintf "% x", -123 ).to_s.should eq( "-7b" )
( sprintf "%X", 123 ).to_s.should eq( "7B" )
( sprintf "%#X", -123 ).to_s.should eq( "-7B" )

puts "# kernel.cr:254 (007.cr)" # :nocode: :example:
( sprintf "%b", 123 ).to_s.should eq( "1111011" )
( sprintf "%+b", 123 ).to_s.should eq( "+1111011" )
( sprintf "%+b", -123 ).to_s.should eq( "-1111011" )
( sprintf "%b", -123 ).to_s.should eq( "-1111011" )
( sprintf "%#b", 0 ).to_s.should eq( "0" )
( sprintf "% b", 123 ).to_s.should eq( " 1111011" )
( sprintf "%+ b", 123 ).to_s.should eq( "+ 1111011" )
( sprintf "% b", -123 ).to_s.should eq( "-1111011" )
( sprintf "%+ b", -123 ).to_s.should eq( "-1111011" )

puts "# kernel.cr:267 (008.cr)" # :nocode: :example:
( sprintf "%a", 123 ).to_s.should eq( "0x1.ecp+6" )
( sprintf "%A", 123 ).to_s.should eq( "0X1.ECP+6" )

puts "# kernel.cr:273 (009.cr)" # :nocode: :example:
( sprintf "%g", 123.4 ).to_s.should eq( "123.4" )
( sprintf "%g", 123.4567 ).to_s.should eq( "123.457" )
( sprintf "%20.8g", 1234.56789 ).to_s.should eq( "           1234.5679" )
( sprintf "%20.8g", 123456789 ).to_s.should eq( "       1.2345679e+08" )
( sprintf "%20.8G", 123456789 ).to_s.should eq( "       1.2345679E+08" )
( sprintf "%20.8g", -123456789 ).to_s.should eq( "       -1.2345679e+08" )
( sprintf "%20.8G", -123456789 ).to_s.should eq( "       -1.2345679E+08" )

puts "# kernel.cr:288 (010.cr)" # :nocode: :example:
( sprintf "%20d", 123 ).to_s.should eq( "                 123" )
( sprintf "%+20d", 123 ).to_s.should eq( "                +123" )
( sprintf "%020d", 123 ).to_s.should eq( "00000000000000000123" )
( sprintf "%+020d", 12 ).to_s.should eq( "+0000000000000000123" )
( sprintf "% 020d", 123 ).to_s.should eq( " 0000000000000000123" )
( sprintf "%-20d", 123 ).to_s.should eq( "123                 " )
( sprintf "%-+20d", 123 ).to_s.should eq( "+123                " )
( sprintf "%- 20d", 123 ).to_s.should eq( " 123                " )
( sprintf "%020x", -123 ).to_s.should eq( "00000000000000000-7b" )
( sprintf "%020X", -123 ).to_s.should eq( "00000000000000000-7B" )

puts "# kernel.cr:311 (011.cr)" # :nocode: :example:
( sprintf "%20.8d", 123 ).to_s.should eq( "                 123" )
( sprintf "%020.8d", 123 ).to_s.should eq( "00000000000000000123" )
( sprintf "%20.8o", 123 ).to_s.should eq( "                 173" )
( sprintf "%020.8o", 123 ).to_s.should eq( "00000000000000000173" )
( sprintf "%20.8x", 123 ).to_s.should eq( "                  7b" )
( sprintf "%020.8x", 123 ).to_s.should eq( "0000000000000000007b" )
( sprintf "%20.8b", 123 ).to_s.should eq( "            01111011" )
( sprintf "%20.8d", -123 ).to_s.should eq( "                -123" )
( sprintf "%020.8d", -123 ).to_s.should eq( "0000000000000000-123" )
( sprintf "%20.8o", -123 ).to_s.should eq( "                -173" )
( sprintf "%20.8x", -123 ).to_s.should eq( "                 -7b" )
( sprintf "%20.8b", -11 ).to_s.should eq( "               -1011" )

puts "# kernel.cr:327 (012.cr)" # :nocode: :example:
( sprintf "%20.8e", 1234.56789 ).to_s.should eq( "      1.23456789e+03" )

puts "# kernel.cr:332 (013.cr)" # :nocode: :example:
( sprintf "%20.8f", 1234.56789 ).to_s.should eq( "       1234.56789000" )

puts "# kernel.cr:337 (014.cr)" # :nocode: :example:
( sprintf "%20.8g", 1234.56789 ).to_s.should eq( "           1234.5679" )
( sprintf "%20.8g", 123456789 ).to_s.should eq( "       1.2345679e+08" )
( sprintf "%-20.8g", 123456789 ).to_s.should eq( "1.2345679e+08       " )

puts "# kernel.cr:344 (015.cr)" # :nocode: :example:
( sprintf "%20.8s", "string test" ).to_s.should eq( "            string t" )

puts "# kernel.cr:349 (016.cr)" # :nocode: :example:
( sprintf "%d %04x", 123, 123 ).to_s.should eq( "123 007b" )
( sprintf "%08b '%4s'", 123, 123 ).to_s.should eq( "01111011 ' 123'" )
( sprintf "%+g:% g:%-g", 1.23, 1.23, 1.23 ).to_s.should eq( "+1.23: 1.23:1.23" )

puts "# kernel.cr:396 (017.cr)" # :nocode: :example:
( p foo: 23, bar: 42 ).should eq( {foo: 23, bar: 42} )

puts "# kernel.cr:429 (018.cr)" # :nocode: :example:
( p foo: 23, bar: 42 ).should eq( {foo: 23, bar: 42} )

puts "# kernel.cr:483 (019.cr)" # :nocode: :example:
def do_at_exit(str1)
  at_exit { print str1 }
end

at_exit { puts "cruel world" }
do_at_exit("goodbye ")
exit

