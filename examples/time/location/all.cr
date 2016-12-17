# time/location.cr: 6 examples
require "time/location"

# time/location.cr:17 (001.cr)
location = Time::Location.load("Europe/Berlin")
location # => #<Time::Location Europe/Berlin>
time = Time.new(2016, 2, 15, 21, 1, 10, location: location)
time # => 2016-02-15 21:01:10 +01:00 Europe/Berlin

# time/location.cr:31 (002.cr)
location = Time::Location.fixed(3600)
location       # => #<Time::Location +01:00>
location.zones # => [#<Time::Location::Zone +01:00 (0s) STD>]

# time/location.cr:45 (003.cr)
location = Time::Location.local
Time::Location.local = Time::Location.load("America/New_York")

# time/location.cr:233 (004.cr)
location = Time::Location.load("Europe/Berlin")

# time/location.cr:260 (005.cr)
# pending by 'file:pendings/time/location/005.cr'
# # This tries to load the file `/usr/share/zoneinfo/Custom/Location`
# ENV["ZONEINFO"] = "/usr/share/zoneinfo/"
# Time::Location.load("Custom/Location")
# 
# # This tries to load the file `Custom/Location` in the uncompressed ZIP
# # file at `/path/to/zoneinfo.zip`
# ENV["ZONEINFO"] = "/path/to/zoneinfo.zip"
# Time::Location.load("Custom/Location")

# time/location.cr:315 (006.cr)
Time.now.location # => #<Time::Location America/New_York>
Time::Location.local = Time::Location.load("Europe/Berlin")
Time.now.location # => #<Time::Location Europe/Berlin>
