require "spec"
require "time/format/custom/http_date"
it "time/format/custom/http_date.cr" do
puts # :nocode:

puts "# time/format/custom/http_date.cr:11 (001.cr)" # :nocode: :example:
( Time::Format::HTTP_DATE.parse("Sun, 14 Feb 2016 21:00:00 GMT") ).should eq( Time.parse("2016-02-14 21:00:00 UTC", "%F %T %z") )
( Time::Format::HTTP_DATE.parse("Sunday, 14-Feb-16 21:00:00 GMT") ).should eq( Time.parse("2016-02-14 21:00:00 UTC", "%F %T %z") )
( Time::Format::HTTP_DATE.parse("Sun Feb 14 21:00:00 2016") ).should eq( Time.parse("2016-02-14 21:00:00 UTC", "%F %T %z") )

( Time::Format::HTTP_DATE.format(Time.utc(2016, 2, 15)) ).to_s.should eq( "Mon, 15 Feb 2016 00:00:00 GMT" )


end
