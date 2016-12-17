# bit_array.cr:11
require "bit_array"

ba = BitArray.new(12) # => "BitArray[000000000000]"
ba[2]                 # => false
0.upto(5) { |i| ba[i * 2] = true }
ba    # => "BitArray[101010101010]"
ba[2] # => true
