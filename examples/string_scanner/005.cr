# string_scanner.cr:168
require "string_scanner"
s = StringScanner.new("test string")
s.check_until(/tr/) # => "test str"
s.check_until(/g/)  # => "test string"
