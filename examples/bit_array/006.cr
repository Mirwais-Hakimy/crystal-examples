# bit_array.cr:190
require "bit_array"
ba = BitArray.new(5)
ba[2] = true; ba[3] = true
ba # => BitArray[00110]
ba.invert
ba # => BitArray[11001]
