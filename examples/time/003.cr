# time.cr:52
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
