# bit_array.cr:101
require "bit_array"
ba = BitArray.new(5)
ba[0] = true; ba[2] = true; ba[4] = true
ba # => BitArray[10101]

ba[-3, 3] # => BitArray[101]
# ba[6, 1]  # raise indexError
ba[1, 2]  # => BitArray[01]
ba[5, 1]  # => BitArray[]
