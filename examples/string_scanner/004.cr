# string_scanner.cr:155
require "string_scanner"
s = StringScanner.new("this is a string")
s.offset = 5
s.check(/\w+/) # => "is"
s.check(/\w+/) # => "is"
