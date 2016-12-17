# string_scanner.cr:258
require "string_scanner"
s = StringScanner.new("this is a string")
s.scan(/(\w+\s?){2}/) # => "this is "
s.rest                # => "a string"
