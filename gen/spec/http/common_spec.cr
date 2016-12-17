require "spec"
require "http/common"
it "http/common.cr" do
puts # :nocode:

puts "# http/common.cr:85 (001.cr)" # :nocode: :example:
line = "Server: nginx"
name, value = line.split ':', 2
( {name, value.lstrip} ).should eq( {"Server", "nginx"} )

puts "# http/common.cr:245 (002.cr)" # :nocode: :example:
( HTTP.parse_time("Sun, 14 Feb 2016 21:00:00 GMT") ).to_s.should eq( "2016-02-14 21:00:00 UTC" )
( HTTP.parse_time("Sunday, 14-Feb-16 21:00:00 GMT") ).to_s.should eq( "2016-02-14 21:00:00 UTC" )
( HTTP.parse_time("Sun Feb 14 21:00:00 2016") ).to_s.should eq( "2016-02-14 21:00:00 UTC" )

puts "# http/common.cr:263 (003.cr)" # :nocode: :example:
( HTTP.format_time(Time.utc(2016, 2, 15)) ).to_s.should eq( "Mon, 15 Feb 2016 00:00:00 GMT" )

puts "# http/common.cr:275 (004.cr)" # :nocode: :example:
quoted = %q(\"foo\\bar\")
( HTTP.dequote_string(quoted) ).should eq( %q("foo\bar") )

puts "# http/common.cr:300 (005.cr)" # :nocode: :example:
string = %q("foo\ bar")
io = IO::Memory.new
HTTP.quote_string(string, io)
io.rewind
( io.gets_to_end ).should eq( %q(\"foo\\\ bar\") )

puts "# http/common.cr:324 (006.cr)" # :nocode: :example:
string = %q("foo\ bar")
( HTTP.quote_string(string) ).should eq( %q(\"foo\\\ bar\") )


end
