# time.cr:541
new_year = Time.utc(2019, 1, 1, 0, 0, 0)
tokyo = new_year.to_local_in(Time::Location.load("Asia/Tokyo"))
new_york = new_year.to_local_in(Time::Location.load("America/New_York"))
tokyo.to_s    # => 2019-01-01 00:00:00.0 +09:00 Asia/Tokyo
new_york.to_s # => 2019-01-01 00:00:00.0 -05:00 America/New_York
