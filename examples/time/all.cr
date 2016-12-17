# time.cr: 41 examples

# time.cr:23 (001.cr)
Time.utc_now                                  # returns the current time in UTC
Time.now Time::Location.load("Europe/Berlin") # returns the current time in time zone Europe/Berlin
Time.now                                      # returns the current time in current time zone

# time.cr:38 (002.cr)
time = Time.utc(2016, 2, 15, 10, 20, 30)
time.to_s # => 2016-02-15 10:20:30 UTC
time = Time.new(2016, 2, 15, 10, 20, 30, location: Time::Location.load("Europe/Berlin"))
time.to_s # => 2016-02-15 10:20:30 +01:00 Europe/Berlin
# The time-of-day can be omitted and defaults to midnight (start of day):
time = Time.utc(2016, 2, 15)
time.to_s # => 2016-02-15 00:00:00 UTC

# time.cr:52 (003.cr)
time = Time.utc(2016, 2, 15, 10, 20, 30)
time.year        # => 2016
time.month       # => 2
time.day         # => 15
time.hour        # => 10
time.minute      # => 20
time.second      # => 30
time.millisecond # => 0
time.nanosecond  # => 0
time.day_of_week # => Time::DayOfWeek::Monday
time.day_of_year # => 46
time.monday?     # => true
time.time_of_day # => 10:20:30

# time.cr:71 (004.cr)
time.monday? # => true
# ...
time.sunday? # => false

# time.cr:85 (005.cr)
time = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time          # => 2018-03-08 22:05:13 +01:00 Europe/Berlin
time.location # => #<Time::Location Europe/Berlin>
time.zone     # => #<Time::Location::Zone CET +01:00 (3600s) STD>
time.offset   # => 3600

# time.cr:95 (006.cr)
time = Time.utc(2018, 3, 8, 22, 5, 13)
time          # => 2018-03-08 22:05:13.0 UTC
time.location # => #<Time::Location UTC>
time.zone     # => #<Time::Location::Zone UTC +00:00 (0s) STD>
time.offset   # => 0

# time.cr:106 (007.cr)
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = time_de.in Time::Location.load("America/Buenos_Aires")
time_de # => 2018-03-08 22:05:13 +01:00 Europe/Berlin
time_ar # => 2018-03-08 18:05:13 -03:00 America/Buenos_Aires

# time.cr:117 (008.cr)
time_de.to_utc     # => 2018-03-08 21:05:13 UTC
time_ar.to_utc     # => 2018-03-08 21:05:13 UTC
time_de == time_ar # => true

# time.cr:125 (009.cr)
time.to_utc   # equals time.in(Location::UTC)
time.to_local # equals time.in(Location.local)

# time.cr:142 (010.cr)
time = Time.utc(2015, 10, 12, 10, 30, 0)
time.to_s("%Y-%m-%d %H:%M:%S %:z") # => "2015-10-12 10:30:00 +00:00"

# time.cr:150 (011.cr)
Time.parse("2015-10-12 10:30:00 +00:00", "%Y-%m-%d %H:%M:%S %z", Time::Location::UTC)
Time.parse!("2015-10-12 10:30:00 +00:00", "%Y-%m-%d %H:%M:%S %z")

# time.cr:159 (012.cr)
Time.utc(2015, 10, 10) - 5.days # => 2015-10-05 00:00:00 +00:00

span = Time.utc(2015, 10, 10) - Time.utc(2015, 9, 10)
span.days          # => 30
span.total_hours   # => 720
span.total_minutes # => 43200

# time.cr:181 (013.cr)
# pending by 'file:pendings/time/012.cr'
# t1 = Time.utc_now
# # operation that takes 1 minute
# t2 = Time.utc_now
# t2 - t1 # => ?

# time.cr:199 (014.cr)
# pending by 'file:pendings/time/013.cr'
# t1 = Time.monotonic
# # operation that takes 1 minute
# t2 = Time.monotonic
# t2 - t1 # => 1.minute (approximately)

# time.cr:208 (015.cr)
# pending by 'file:pendings/time/014.cr'
# elapsed_time = Time.measure do
#   # operation that takes 20 milliseconds
# end
# elapsed_time # => 20.milliseconds (approximately)

# time.cr:268 (016.cr)
Time.utc_now - Time::UNIX_EPOCH

# time.cr:278 (017.cr)
time = Time.new(2016, 2, 15)
time.day_of_week # => Time::DayOfWeek::Monday

# time.cr:328 (018.cr)
# pending by 'file:pendings/time/017.cr'
# start = Time.monotonic
# # operation that takes 20 milliseconds
# elapsed = Time.monotonic - start # => 20.milliseconds (approximately)
# # operation that takes 50 milliseconds
# elapsed_total = Time.monotonic - start # => 70.milliseconds (approximately)

# time.cr:347 (019.cr)
# pending by 'file:pendings/time/014.cr'
# elapsed_time = Time.measure do
#   # operation that takes 20 milliseconds
# end
# elapsed_time # => 20.milliseconds (approximately)

# time.cr:381 (020.cr)
time = Time.new(2016, 2, 15, 10, 20, 30, location: Time::Location.load("Europe/Berlin"))
time.inspect # => "2016-02-15 10:20:30.0 +01:00 Europe/Berlin"

# time.cr:398 (021.cr)
time = Time.new(2016, 2, 15)
time.to_s # => "2016-02-15 00:00:00 +00:00"

# time.cr:442 (022.cr)
time = Time.utc(2016, 2, 15, 10, 20, 30)
time.to_s # => "2016-02-15 10:20:30 UTC"

# time.cr:459 (023.cr)
time = Time.utc(2016, 2, 15)
time.to_s # => "2016-02-15 00:00:00 UTC"

# time.cr:510 (024.cr)
Time.unix(981173106) # => 2001-02-03 04:05:06 UTC

# time.cr:522 (025.cr)
time = Time.unix_ms(981173106789) # => 2001-02-03 04:05:06.789 UTC
time.millisecond                  # => 789

# time.cr:541 (026.cr)
new_year = Time.utc(2019, 1, 1, 0, 0, 0)
tokyo = new_year.to_local_in(Time::Location.load("Asia/Tokyo"))
new_york = new_year.to_local_in(Time::Location.load("America/New_York"))
tokyo.to_s    # => 2019-01-01 00:00:00.0 +09:00 Asia/Tokyo
new_york.to_s # => 2019-01-01 00:00:00.0 -05:00 America/New_York

# time.cr:842 (027.cr)
time.time_of_day == Time::Span.new(time.hour, time.minute, time.second, time.nanosecond)

# time.cr:905 (028.cr)
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = Time.new(2018, 3, 8, 18, 5, 13, location: Time::Location.load("America/Buenos_Aires"))
time_de == time_ar # => true

# both times represent the same instant:
time_de.to_utc # => 2018-03-08 21:05:13 UTC
time_ar.to_utc # => 2018-03-08 21:05:13 UTC

# time.cr:926 (029.cr)
Time.days_in_month(2016, 2) # => 29
Time.days_in_month(1990, 4) # => 30

# time.cr:947 (030.cr)
Time.days_in_year(1990) # => 365
Time.days_in_year(2004) # => 366

# time.cr:1014 (031.cr)
time = Time.new(2016, 4, 5)
time.to_s("%F") # => "2016-04-05"

# time.cr:1031 (032.cr)
Time.utc(2016, 2, 15).to_rfc3339 # => "2016-02-15T00:00:00Z"

# time.cr:1065 (033.cr)
Time.utc(2016, 2, 15).to_rfc2822 # => "Mon, 15 Feb 2016 00:00:00 +0000"

# time.cr:1093 (034.cr)
Time.parse("2016-04-05", "%F", Time::Location.load("Europe/Berlin")) # => 2016-04-05 00:00:00.0 +02:00 Europe/Berlin

# time.cr:1108 (035.cr)
Time.parse!("2016-04-05 +00:00", "%F %:z") # => 2016-04-05 00:00:00.0 +00:00
# Time.parse!("2016-04-05", "%F")            # raises Time::Format::Error

# time.cr:1124 (036.cr)
Time.parse_utc("2016-04-05", "%F") # => 2016-04-05 00:00:00.0 +00:00

# time.cr:1140 (037.cr)
Time.parse_utc("2016-04-05", "%F") # => 2016-04-05 00:00:00.0 +00:00

# time.cr:1154 (038.cr)
time = Time.utc(2016, 1, 12, 3, 4, 5)
time.to_unix # => 1452567845

# time.cr:1165 (039.cr)
time = Time.utc(2016, 1, 12, 3, 4, 5, nanosecond: 678_000_000)
time.to_unix_ms # => 1452567845678

# time.cr:1176 (040.cr)
time = Time.utc(2016, 1, 12, 3, 4, 5, nanosecond: 678_000_000)
time.to_unix_f # => 1452567845.678

# time.cr:1194 (041.cr)
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = time_de.in Time::Location.load("America/Buenos_Aires")
time_de # => 2018-03-08 22:05:13 +01:00 Europe/Berlin
time_ar # => 2018-03-08 18:05:13 -03:00 America/Buenos_Aires
