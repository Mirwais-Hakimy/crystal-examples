# time.cr:1194
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = time_de.in Time::Location.load("America/Buenos_Aires")
time_de # => 2018-03-08 22:05:13 +01:00 Europe/Berlin
time_ar # => 2018-03-08 18:05:13 -03:00 America/Buenos_Aires
