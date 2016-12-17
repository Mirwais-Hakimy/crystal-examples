# time.cr:85
time = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time          # => 2018-03-08 22:05:13 +01:00 Europe/Berlin
time.location # => #<Time::Location Europe/Berlin>
time.zone     # => #<Time::Location::Zone CET +01:00 (3600s) STD>
time.offset   # => 3600
