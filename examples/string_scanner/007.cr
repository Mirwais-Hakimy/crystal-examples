# string_scanner.cr:201
require "string_scanner"
s = StringScanner.new("Fri Dec 12 1975 14:39")
regex = /(?<wday>\w+) (?<month>\w+) (?<day>\d+)/
s.scan(regex)  # => "Fri Dec 12"
s[0]?          # => "Fri Dec 12"
s[1]?          # => "Fri"
s[2]?          # => "Dec"
s[3]?          # => "12"
s[4]?          # => nil
s["wday"]?     # => "Fri"
s["month"]?    # => "Dec"
s["day"]?      # => "12"
s["year"]?     # => nil
s.scan(/more/) # => nil
s[0]?          # => nil
