# time.cr:381
time = Time.new(2016, 2, 15, 10, 20, 30, location: Time::Location.load("Europe/Berlin"))
time.inspect # => "2016-02-15 10:20:30.0 +01:00 Europe/Berlin"
