# bit_array.cr:177
require "bit_array"
ba = BitArray.new(5)
ba[3] # => false
ba.toggle(3)
ba[3] # => true
