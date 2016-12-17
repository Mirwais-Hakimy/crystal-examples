# bit_array.cr: 7 examples
require "bit_array"

# bit_array.cr:11 (001.cr)
require "bit_array"

ba = BitArray.new(12) # => "BitArray[000000000000]"
ba[2]                 # => false
0.upto(5) { |i| ba[i * 2] = true }
ba    # => "BitArray[101010101010]"
ba[2] # => true

# bit_array.cr:56 (002.cr)
ba = BitArray.new(5)
ba[3] = true

# bit_array.cr:77 (003.cr)
ba = BitArray.new(5)
ba[0] = true; ba[2] = true; ba[4] = true
ba # => BitArray[10101]

ba[1..3]    # => BitArray[010]
ba[4..7]    # => BitArray[1]
# ba[6..10]   # raise IndexError
ba[5..10]   # => BitArray[]
ba[-2...-1] # => BitArray[0]

# bit_array.cr:101 (004.cr)
ba = BitArray.new(5)
ba[0] = true; ba[2] = true; ba[4] = true
ba # => BitArray[10101]

ba[-3, 3] # => BitArray[101]
# ba[6, 1]  # raise indexError
ba[1, 2]  # => BitArray[01]
ba[5, 1]  # => BitArray[]

# bit_array.cr:177 (005.cr)
ba = BitArray.new(5)
ba[3] # => false
ba.toggle(3)
ba[3] # => true

# bit_array.cr:190 (006.cr)
ba = BitArray.new(5)
ba[2] = true; ba[3] = true
ba # => BitArray[00110]
ba.invert
ba # => BitArray[11001]

# bit_array.cr:205 (007.cr)
ba = BitArray.new(5)
ba.to_s # => "BitArray[00000]"
