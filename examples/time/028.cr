# time.cr:905
time_de = Time.new(2018, 3, 8, 22, 5, 13, location: Time::Location.load("Europe/Berlin"))
time_ar = Time.new(2018, 3, 8, 18, 5, 13, location: Time::Location.load("America/Buenos_Aires"))
time_de == time_ar # => true

# both times represent the same instant:
time_de.to_utc # => 2018-03-08 21:05:13 UTC
time_ar.to_utc # => 2018-03-08 21:05:13 UTC
