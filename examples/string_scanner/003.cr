# string_scanner.cr:98
require "string_scanner"
s = StringScanner.new("test string")
s.scan_until(/tr/) # => "test str"
s.scan_until(/tr/) # => nil
s.scan_until(/g/)  # => "ing"
