# string_scanner.cr: 9 examples
require "string_scanner"

# string_scanner.cr:5 (001.cr)
require "string_scanner"

s = StringScanner.new("This is an example string")
s.eos? # => false

s.scan(/\w+/) # => "This"
s.scan(/\w+/) # => nil
s.scan(/\s+/) # => " "
s.scan(/\s+/) # => nil
s.scan(/\w+/) # => "is"
s.eos?        # => false

s.scan(/\s+/) # => " "
s.scan(/\w+/) # => "an"
s.scan(/\s+/) # => " "
s.scan(/\w+/) # => "example"
s.scan(/\s+/) # => " "
s.scan(/\w+/) # => "string"
s.eos?        # => true

s.scan(/\s+/) # => nil
s.scan(/\w+/) # => nil

# string_scanner.cr:83 (002.cr)
s = StringScanner.new("test string")
s.scan(/\w+/)   # => "test"
s.scan(/\w+/)   # => nil
s.scan(/\s\w+/) # => " string"
s.scan(/.*/)    # => ""

# string_scanner.cr:98 (003.cr)
s = StringScanner.new("test string")
s.scan_until(/tr/) # => "test str"
s.scan_until(/tr/) # => nil
s.scan_until(/g/)  # => "ing"

# string_scanner.cr:155 (004.cr)
s = StringScanner.new("this is a string")
s.offset = 5
s.check(/\w+/) # => "is"
s.check(/\w+/) # => "is"

# string_scanner.cr:168 (005.cr)
s = StringScanner.new("test string")
s.check_until(/tr/) # => "test str"
s.check_until(/g/)  # => "test string"

# string_scanner.cr:181 (006.cr)
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

# string_scanner.cr:201 (007.cr)
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

# string_scanner.cr:223 (008.cr)
s = StringScanner.new("this is a string")
s.eos?                # => false
s.scan(/(\w+\s?){4}/) # => "this is a string"
s.eos?                # => true

# string_scanner.cr:258 (009.cr)
s = StringScanner.new("this is a string")
s.scan(/(\w+\s?){2}/) # => "this is "
s.rest                # => "a string"
