require "spec"
require "time/location"
it "time/location.cr" do
puts # :nocode:

puts "# time/location.cr:17 (001.cr)" # :nocode: :example:
location = Time::Location.load("Europe/Berlin")
( location ).class.to_s.should eq( "Time::Location" )
time = Time.new(2016, 2, 15, 21, 1, 10, location: location)
( time ).should eq( Time.parse("2016-02-15 21:01:10 +01:00 Europe/Berlin", "%F %T %z") )

puts "# time/location.cr:31 (002.cr)" # :nocode: :example:
location = Time::Location.fixed(3600)
( location ).class.to_s.should eq( "Time::Location" )
location.zones # => [#<Time::Location::Zone +01:00 (0s) STD>]

puts "# time/location.cr:45 (003.cr)" # :nocode: :example:
location = Time::Location.local
Time::Location.local = Time::Location.load("America/New_York")

puts "# time/location.cr:233 (004.cr)" # :nocode: :example:
location = Time::Location.load("Europe/Berlin")

puts "# time/location.cr:260 (005.cr)" # :nocode: :example:
# pending by 'file:pendings/time/location/005.cr' # :pending:
# # This tries to load the file `/usr/share/zoneinfo/Custom/Location`
# ENV["ZONEINFO"] = "/usr/share/zoneinfo/"
# Time::Location.load("Custom/Location")
# 
# # This tries to load the file `Custom/Location` in the uncompressed ZIP
# # file at `/path/to/zoneinfo.zip`
# ENV["ZONEINFO"] = "/path/to/zoneinfo.zip"
# Time::Location.load("Custom/Location")

puts "# time/location.cr:315 (006.cr)" # :nocode: :example:
( Time.now.location ).class.to_s.should eq( "Time::Location" )
Time::Location.local = Time::Location.load("Europe/Berlin")
( Time.now.location ).class.to_s.should eq( "Time::Location" )


end
