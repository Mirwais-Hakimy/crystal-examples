# time/location.cr:315
require "time/location"
Time.now.location # => #<Time::Location America/New_York>
Time::Location.local = Time::Location.load("Europe/Berlin")
Time.now.location # => #<Time::Location Europe/Berlin>
