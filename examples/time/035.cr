# time.cr:1108
Time.parse!("2016-04-05 +00:00", "%F %:z") # => 2016-04-05 00:00:00.0 +00:00
# Time.parse!("2016-04-05", "%F")            # raises Time::Format::Error
