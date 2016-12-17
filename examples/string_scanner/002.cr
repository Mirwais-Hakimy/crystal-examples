# string_scanner.cr:83
require "string_scanner"
s = StringScanner.new("test string")
s.scan(/\w+/)   # => "test"
s.scan(/\w+/)   # => nil
s.scan(/\s\w+/) # => " string"
s.scan(/.*/)    # => ""
