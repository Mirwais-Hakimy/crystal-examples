require "spec"
require "string_scanner"
it "string_scanner.cr" do
puts # :nocode:

puts "# string_scanner.cr:5 (001.cr)" # :nocode: :example:
# require "string_scanner"

s = StringScanner.new("This is an example string")
( s.eos? ).should eq( false )

( s.scan(/\w+/) ).to_s.should eq( "This" )
( s.scan(/\w+/) ).should eq( nil )
( s.scan(/\s+/) ).to_s.should eq( " " )
( s.scan(/\s+/) ).should eq( nil )
( s.scan(/\w+/) ).to_s.should eq( "is" )
( s.eos? ).should eq( false )

( s.scan(/\s+/) ).to_s.should eq( " " )
( s.scan(/\w+/) ).to_s.should eq( "an" )
( s.scan(/\s+/) ).to_s.should eq( " " )
( s.scan(/\w+/) ).to_s.should eq( "example" )
( s.scan(/\s+/) ).to_s.should eq( " " )
( s.scan(/\w+/) ).to_s.should eq( "string" )
( s.eos? ).should eq( true )

( s.scan(/\s+/) ).should eq( nil )
( s.scan(/\w+/) ).should eq( nil )

puts "# string_scanner.cr:83 (002.cr)" # :nocode: :example:
s = StringScanner.new("test string")
( s.scan(/\w+/) ).to_s.should eq( "test" )
( s.scan(/\w+/) ).should eq( nil )
( s.scan(/\s\w+/) ).to_s.should eq( " string" )
( s.scan(/.*/) ).to_s.should eq( "" )

puts "# string_scanner.cr:98 (003.cr)" # :nocode: :example:
s = StringScanner.new("test string")
( s.scan_until(/tr/) ).to_s.should eq( "test str" )
( s.scan_until(/tr/) ).should eq( nil )
( s.scan_until(/g/) ).to_s.should eq( "ing" )

puts "# string_scanner.cr:155 (004.cr)" # :nocode: :example:
s = StringScanner.new("this is a string")
s.offset = 5
( s.check(/\w+/) ).to_s.should eq( "is" )
( s.check(/\w+/) ).to_s.should eq( "is" )

puts "# string_scanner.cr:168 (005.cr)" # :nocode: :example:
s = StringScanner.new("test string")
( s.check_until(/tr/) ).to_s.should eq( "test str" )
( s.check_until(/g/) ).to_s.should eq( "test string" )

puts "# string_scanner.cr:181 (006.cr)" # :nocode: :example:
s = StringScanner.new("Fri Dec 12 1975 14:39")
regex = /(?<wday>\w+) (?<month>\w+) (?<day>\d+)/
( s.scan(regex) ).to_s.should eq( "Fri Dec 12" )
( s[0] ).to_s.should eq( "Fri Dec 12" )
( s[1] ).to_s.should eq( "Fri" )
( s[2] ).to_s.should eq( "Dec" )
( s[3] ).to_s.should eq( "12" )
( s["wday"] ).to_s.should eq( "Fri" )
( s["month"] ).to_s.should eq( "Dec" )
( s["day"] ).to_s.should eq( "12" )

puts "# string_scanner.cr:201 (007.cr)" # :nocode: :example:
s = StringScanner.new("Fri Dec 12 1975 14:39")
regex = /(?<wday>\w+) (?<month>\w+) (?<day>\d+)/
( s.scan(regex) ).to_s.should eq( "Fri Dec 12" )
( s[0]? ).to_s.should eq( "Fri Dec 12" )
( s[1]? ).to_s.should eq( "Fri" )
( s[2]? ).to_s.should eq( "Dec" )
( s[3]? ).to_s.should eq( "12" )
( s[4]? ).should eq( nil )
( s["wday"]? ).to_s.should eq( "Fri" )
( s["month"]? ).to_s.should eq( "Dec" )
( s["day"]? ).to_s.should eq( "12" )
( s["year"]? ).should eq( nil )
( s.scan(/more/) ).should eq( nil )
( s[0]? ).should eq( nil )

puts "# string_scanner.cr:223 (008.cr)" # :nocode: :example:
s = StringScanner.new("this is a string")
( s.eos? ).should eq( false )
( s.scan(/(\w+\s?){4}/) ).to_s.should eq( "this is a string" )
( s.eos? ).should eq( true )

puts "# string_scanner.cr:258 (009.cr)" # :nocode: :example:
s = StringScanner.new("this is a string")
( s.scan(/(\w+\s?){2}/) ).to_s.should eq( "this is " )
( s.rest ).to_s.should eq( "a string" )


end
