# time.cr:23
Time.utc_now                                  # returns the current time in UTC
Time.now Time::Location.load("Europe/Berlin") # returns the current time in time zone Europe/Berlin
Time.now                                      # returns the current time in current time zone
