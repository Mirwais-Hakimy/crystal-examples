# string_scanner.cr:5
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
