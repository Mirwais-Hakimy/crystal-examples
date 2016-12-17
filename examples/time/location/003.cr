# time/location.cr:45
require "time/location"
location = Time::Location.local
Time::Location.local = Time::Location.load("America/New_York")
