# time/location.cr:260
require "time/location"
# This tries to load the file `/usr/share/zoneinfo/Custom/Location`
ENV["ZONEINFO"] = "/usr/share/zoneinfo/"
Time::Location.load("Custom/Location")

# This tries to load the file `Custom/Location` in the uncompressed ZIP
# file at `/path/to/zoneinfo.zip`
ENV["ZONEINFO"] = "/path/to/zoneinfo.zip"
Time::Location.load("Custom/Location")
