# bit_array.cr:77
require "bit_array"
ba = BitArray.new(5)
ba[0] = true; ba[2] = true; ba[4] = true
ba # => BitArray[10101]

ba[1..3]    # => BitArray[010]
ba[4..7]    # => BitArray[1]
# ba[6..10]   # raise IndexError
ba[5..10]   # => BitArray[]
ba[-2...-1] # => BitArray[0]
