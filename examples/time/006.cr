# time.cr:95
time = Time.utc(2018, 3, 8, 22, 5, 13)
time          # => 2018-03-08 22:05:13.0 UTC
time.location # => #<Time::Location UTC>
time.zone     # => #<Time::Location::Zone UTC +00:00 (0s) STD>
time.offset   # => 0
