# time/location.cr:31
require "time/location"
location = Time::Location.fixed(3600)
location       # => #<Time::Location +01:00>
location.zones # => [#<Time::Location::Zone +01:00 (0s) STD>]
