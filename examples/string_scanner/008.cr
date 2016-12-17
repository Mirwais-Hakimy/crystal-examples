# string_scanner.cr:223
require "string_scanner"
s = StringScanner.new("this is a string")
s.eos?                # => false
s.scan(/(\w+\s?){4}/) # => "this is a string"
s.eos?                # => true
