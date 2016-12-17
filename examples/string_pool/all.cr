# string_pool.cr: 7 examples
require "string_pool"

# string_pool.cr:5 (001.cr)
require "string_pool"

pool = StringPool.new
a = "foo" + "bar"
b = "foo" + "bar"
a.object_id # => 136294360
b.object_id # => 136294336
a = pool.get(a)
b = pool.get(b)
a.object_id # => 136294312
b.object_id # => 136294312

# string_pool.cr:27 (002.cr)
pool = StringPool.new
pool.size # => 0

# string_pool.cr:43 (003.cr)
pool = StringPool.new
pool.empty? # => true
pool.get("crystal")
pool.empty? # => false

# string_pool.cr:58 (004.cr)
pool = StringPool.new
ptr = Pointer.malloc(9) { |i| ('a'.ord + i).to_u8 }
slice = Slice.new(ptr, 3)
pool.empty? # => true
pool.get(slice)
pool.empty? # => false

# string_pool.cr:75 (005.cr)
pool = StringPool.new
pool.get("hey".to_unsafe, 3)
pool.size # => 1

# string_pool.cr:126 (006.cr)
pool = StringPool.new
io = IO::Memory.new "crystal"
pool.empty? # => true
pool.get(io)
pool.empty? # => false

# string_pool.cr:142 (007.cr)
pool = StringPool.new
string = "crystal"
pool.empty? # => true
pool.get(string)
pool.empty? # => false
