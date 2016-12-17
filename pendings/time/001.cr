# time.cr:7
time = Time.new(2016, 2, 15, 10, 20, 30)

time.year    # => 2016
time.month   # => 2
time.day     # => 15
time.hour    # => 10
time.minute  # => 20
time.second  # => 30
time.monday? # => true

# Creating a time instance with a date only in local timezone `Time::Location.local`.
# The examples show an offset of `+01:00` but that can vary depending on
Time.new(2016, 2, 15) # => 2016-02-15 00:00:00 +01:00

# Specifying a time
Time.new(2016, 2, 15, 10, 20, 30) # => 2016-02-15 10:20:30 +01:00

# Creating a time instance in UTC
Time.utc(2016, 2, 15, 10, 20, 30) # => 2016-02-15 10:20:30 UTC
