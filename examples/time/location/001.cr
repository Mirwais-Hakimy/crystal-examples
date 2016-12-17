# time/location.cr:17
require "time/location"
location = Time::Location.load("Europe/Berlin")
location # => #<Time::Location Europe/Berlin>
time = Time.new(2016, 2, 15, 21, 1, 10, location: location)
time # => 2016-02-15 21:01:10 +01:00 Europe/Berlin
