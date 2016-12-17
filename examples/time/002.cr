# time.cr:38
time = Time.utc(2016, 2, 15, 10, 20, 30)
time.to_s # => 2016-02-15 10:20:30 UTC
time = Time.new(2016, 2, 15, 10, 20, 30, location: Time::Location.load("Europe/Berlin"))
time.to_s # => 2016-02-15 10:20:30 +01:00 Europe/Berlin
# The time-of-day can be omitted and defaults to midnight (start of day):
time = Time.utc(2016, 2, 15)
time.to_s # => 2016-02-15 00:00:00 UTC
