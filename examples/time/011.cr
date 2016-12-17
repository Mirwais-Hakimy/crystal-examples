# time.cr:150
Time.parse("2015-10-12 10:30:00 +00:00", "%Y-%m-%d %H:%M:%S %z", Time::Location::UTC)
Time.parse!("2015-10-12 10:30:00 +00:00", "%Y-%m-%d %H:%M:%S %z")
