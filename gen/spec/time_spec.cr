require "spec"

it "time.cr" do
puts # :nocode:

puts "# time.cr:23 (001.cr)" # :nocode: :example:
Time.utc_now                                  # returns the current time in UTC
Time.now Time::Location.load("Europe/Berlin") # returns the current time in time zone Europe/Berlin
Time.now                                      # returns the current time in current time zone

puts "# time.cr:38 (002.cr)" # :nocode: :example:
time = Time.utc(2016, 2, 15, 10, 20, 30)
( time.to_s ).should eq( Time.parse("2016-02-15 10:20:30 UTC", "%F %T %z") )
time = Time.new(2016, 2, 15, 10, 20, 30, location: Time::Location.load("Europe/Berlin"))
( time.to_s ).should eq( Time.parse("2016-02-15 10:20:30 +01:00 Europe/Berlin", "%F %T %z") )
# The time-of-day can be omitted and defaults to midnight (start of day):
time = Time.utc(2016, 2, 15)
( time.to_s ).should eq( Time.parse("2016-02-15 00:00:00 UTC", "%F %T %z") )

puts "# time.cr:52 (003.cr)" # :nocode: :example:
time = Time.utc(2016, 2, 15, 10, 20, 30)
( time.year ).should eq( 2016 )
( time.month ).should eq( 2 )
( time.day ).should eq( 15 )
( time.hour ).should eq( 10 )
( time.minute ).should eq( 20 )
( time.second ).should eq( 30 )
( time.millisecond ).should eq( 0 )
( time.nanosecond ).should eq( 0 )
( time.day_of_week ).should eq( Time::DayOfWeek::Monday )
( time.day_of_year ).should eq( 46 )
( time.monday? ).should eq( true )
( time.time_of_day ).should eq( Time::Span.new(0, 10, 20, 30, 0) )

puts "# time.cr:71 (004.cr)" # :nocode: :example:
( time.monday? ).should eq( true )
# ...
( time.sunday? ).should eq( false )

puts "# time.cr:85 (005.cr)" # :nocode: :example:
time = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
( time ).should eq( Time.parse("2018-03-08 22:05:13 +01:00 Europe/Berlin", "%F %T %z") )
( time.location ).class.to_s.should eq( "Time::Location" )
( time.zone ).class.to_s.should eq( "Time::Location::Zone" )
( time.offset ).should eq( 3600 )

puts "# time.cr:95 (006.cr)" # :nocode: :example:
time = Time.utc(2018, 3, 8, 22, 5, 13)
( time ).should eq( Time.parse("2018-03-08 22:05:13.000 UTC", "%F %T.%L %z") )
( time.location ).class.to_s.should eq( "Time::Location" )
( time.zone ).class.to_s.should eq( "Time::Location::Zone" )
( time.offset ).should eq( 0 )

puts "# time.cr:106 (007.cr)" # :nocode: :example:
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = time_de.in Time::Location.load("America/Buenos_Aires")
( time_de ).should eq( Time.parse("2018-03-08 22:05:13 +01:00 Europe/Berlin", "%F %T %z") )
( time_ar ).should eq( Time.parse("2018-03-08 18:05:13 -03:00 America/Buenos_Aires", "%F %T %z") )

puts "# time.cr:117 (008.cr)" # :nocode: :example:
time_de.to_utc     # => 2018-03-08 21:05:13 UTC
time_ar.to_utc     # => 2018-03-08 21:05:13 UTC
( time_de == time_ar ).should eq( true )

puts "# time.cr:125 (009.cr)" # :nocode: :example:
time.to_utc   # equals time.in(Location::UTC)
time.to_local # equals time.in(Location.local)

puts "# time.cr:142 (010.cr)" # :nocode: :example:
time = Time.utc(2015, 10, 12, 10, 30, 0)
( time.to_s("%Y-%m-%d %H:%M:%S %:z") ).to_s.should eq( "2015-10-12 10:30:00 +00:00" )

puts "# time.cr:150 (011.cr)" # :nocode: :example:
Time.parse("2015-10-12 10:30:00 +00:00", "%Y-%m-%d %H:%M:%S %z", Time::Location::UTC)
Time.parse!("2015-10-12 10:30:00 +00:00", "%Y-%m-%d %H:%M:%S %z")

puts "# time.cr:159 (012.cr)" # :nocode: :example:
( Time.utc(2015, 10, 10) - 5.days ).should eq( Time.parse("2015-10-05 00:00:00 +00:00", "%F %T %z") )

span = Time.utc(2015, 10, 10) - Time.utc(2015, 9, 10)
( span.days ).should eq( 30 )
( span.total_hours ).should eq( 720 )
( span.total_minutes ).should eq( 43200 )

puts "# time.cr:181 (013.cr)" # :nocode: :example:
# pending by 'file:pendings/time/012.cr' # :pending:
# t1 = Time.utc_now
# # operation that takes 1 minute
# t2 = Time.utc_now
# t2 - t1 # => ?

puts "# time.cr:199 (014.cr)" # :nocode: :example:
# pending by 'file:pendings/time/013.cr' # :pending:
# t1 = Time.monotonic
# # operation that takes 1 minute
# t2 = Time.monotonic
# t2 - t1 # => 1.minute (approximately)

puts "# time.cr:208 (015.cr)" # :nocode: :example:
# pending by 'file:pendings/time/014.cr' # :pending:
# elapsed_time = Time.measure do
#   # operation that takes 20 milliseconds
# end
# elapsed_time # => 20.milliseconds (approximately)

puts "# time.cr:268 (016.cr)" # :nocode: :example:
Time.utc_now - Time::UNIX_EPOCH

puts "# time.cr:278 (017.cr)" # :nocode: :example:
time = Time.new(2016, 2, 15)
( time.day_of_week ).should eq( Time::DayOfWeek::Monday )

puts "# time.cr:328 (018.cr)" # :nocode: :example:
# pending by 'file:pendings/time/017.cr' # :pending:
# start = Time.monotonic
# # operation that takes 20 milliseconds
# elapsed = Time.monotonic - start # => 20.milliseconds (approximately)
# # operation that takes 50 milliseconds
# elapsed_total = Time.monotonic - start # => 70.milliseconds (approximately)

puts "# time.cr:347 (019.cr)" # :nocode: :example:
# pending by 'file:pendings/time/014.cr' # :pending:
# elapsed_time = Time.measure do
#   # operation that takes 20 milliseconds
# end
# elapsed_time # => 20.milliseconds (approximately)

puts "# time.cr:381 (020.cr)" # :nocode: :example:
time = Time.new(2016, 2, 15, 10, 20, 30, location: Time::Location.load("Europe/Berlin"))
( time.inspect ).to_s.should eq( "2016-02-15 10:20:30.0 +01:00 Europe/Berlin" )

puts "# time.cr:398 (021.cr)" # :nocode: :example:
time = Time.new(2016, 2, 15)
( time.to_s ).to_s.should eq( "2016-02-15 00:00:00 +00:00" )

puts "# time.cr:442 (022.cr)" # :nocode: :example:
time = Time.utc(2016, 2, 15, 10, 20, 30)
( time.to_s ).to_s.should eq( "2016-02-15 10:20:30 UTC" )

puts "# time.cr:459 (023.cr)" # :nocode: :example:
time = Time.utc(2016, 2, 15)
( time.to_s ).to_s.should eq( "2016-02-15 00:00:00 UTC" )

puts "# time.cr:510 (024.cr)" # :nocode: :example:
( Time.unix(981173106) ).should eq( Time.parse("2001-02-03 04:05:06 UTC", "%F %T %z") )

puts "# time.cr:522 (025.cr)" # :nocode: :example:
( time = Time.unix_ms(981173106789) ).should eq( Time.parse("2001-02-03 04:05:06.789 UTC", "%F %T.%L %z") )
( time.millisecond ).should eq( 789 )

puts "# time.cr:541 (026.cr)" # :nocode: :example:
new_year = Time.utc(2019, 1, 1, 0, 0, 0)
tokyo = new_year.to_local_in(Time::Location.load("Asia/Tokyo"))
new_york = new_year.to_local_in(Time::Location.load("America/New_York"))
( tokyo.to_s ).should eq( Time.parse("2019-01-01 00:00:00.000 +09:00 Asia/Tokyo", "%F %T.%L %z") )
( new_york.to_s ).should eq( Time.parse("2019-01-01 00:00:00.000 -05:00 America/New_York", "%F %T.%L %z") )

puts "# time.cr:842 (027.cr)" # :nocode: :example:
time.time_of_day == Time::Span.new(time.hour, time.minute, time.second, time.nanosecond)

puts "# time.cr:905 (028.cr)" # :nocode: :example:
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = Time.new(2018, 3, 8, 18, 5, 13, location: Time::Location.load("America/Buenos_Aires"))
( time_de == time_ar ).should eq( true )

# both times represent the same instant:
time_de.to_utc # => 2018-03-08 21:05:13 UTC
time_ar.to_utc # => 2018-03-08 21:05:13 UTC

puts "# time.cr:926 (029.cr)" # :nocode: :example:
( Time.days_in_month(2016, 2) ).should eq( 29 )
( Time.days_in_month(1990, 4) ).should eq( 30 )

puts "# time.cr:947 (030.cr)" # :nocode: :example:
( Time.days_in_year(1990) ).should eq( 365 )
( Time.days_in_year(2004) ).should eq( 366 )

puts "# time.cr:1014 (031.cr)" # :nocode: :example:
time = Time.new(2016, 4, 5)
( time.to_s("%F") ).to_s.should eq( "2016-04-05" )

puts "# time.cr:1031 (032.cr)" # :nocode: :example:
( Time.utc(2016, 2, 15).to_rfc3339 ).to_s.should eq( "2016-02-15T00:00:00Z" )

puts "# time.cr:1065 (033.cr)" # :nocode: :example:
( Time.utc(2016, 2, 15).to_rfc2822 ).to_s.should eq( "Mon, 15 Feb 2016 00:00:00 +0000" )

puts "# time.cr:1093 (034.cr)" # :nocode: :example:
( Time.parse("2016-04-05", "%F", Time::Location.load("Europe/Berlin")) ).should eq( Time.parse("2016-04-05 00:00:00.000 +02:00 Europe/Berlin", "%F %T.%L %z") )

puts "# time.cr:1108 (035.cr)" # :nocode: :example:
( Time.parse!("2016-04-05 +00:00", "%F %:z") ).should eq( Time.parse("2016-04-05 00:00:00.000 +00:00", "%F %T.%L %z") )
expect_raises(Time::Format::Error) { Time.parse!("2016-04-05", "%F") }

puts "# time.cr:1124 (036.cr)" # :nocode: :example:
( Time.parse_utc("2016-04-05", "%F") ).should eq( Time.parse("2016-04-05 00:00:00.000 +00:00", "%F %T.%L %z") )

puts "# time.cr:1140 (037.cr)" # :nocode: :example:
( Time.parse_utc("2016-04-05", "%F") ).should eq( Time.parse("2016-04-05 00:00:00.000 +00:00", "%F %T.%L %z") )

puts "# time.cr:1154 (038.cr)" # :nocode: :example:
time = Time.utc(2016, 1, 12, 3, 4, 5)
( time.to_unix ).should eq( 1452567845 )

puts "# time.cr:1165 (039.cr)" # :nocode: :example:
time = Time.utc(2016, 1, 12, 3, 4, 5, nanosecond: 678_000_000)
( time.to_unix_ms ).should eq( 1452567845678 )

puts "# time.cr:1176 (040.cr)" # :nocode: :example:
time = Time.utc(2016, 1, 12, 3, 4, 5, nanosecond: 678_000_000)
( time.to_unix_f ).try(&.to_f).to_s.should eq( "1452567845.678" )

puts "# time.cr:1194 (041.cr)" # :nocode: :example:
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = time_de.in Time::Location.load("America/Buenos_Aires")
( time_de ).should eq( Time.parse("2018-03-08 22:05:13 +01:00 Europe/Berlin", "%F %T %z") )
( time_ar ).should eq( Time.parse("2018-03-08 18:05:13 -03:00 America/Buenos_Aires", "%F %T %z") )


end
