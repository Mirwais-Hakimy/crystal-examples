# string_scanner.cr:181
require "string_scanner"
s = StringScanner.new("Fri Dec 12 1975 14:39")
regex = /(?<wday>\w+) (?<month>\w+) (?<day>\d+)/
s.scan(regex) # => "Fri Dec 12"
s[0]          # => "Fri Dec 12"
s[1]          # => "Fri"
s[2]          # => "Dec"
s[3]          # => "12"
s["wday"]     # => "Fri"
s["month"]    # => "Dec"
s["day"]      # => "12"
