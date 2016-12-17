# string_pool.cr:58
require "string_pool"
pool = StringPool.new
ptr = Pointer.malloc(9) { |i| ('a'.ord + i).to_u8 }
slice = Slice.new(ptr, 3)
pool.empty? # => true
pool.get(slice)
pool.empty? # => false
