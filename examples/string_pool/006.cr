# string_pool.cr:126
require "string_pool"
pool = StringPool.new
io = IO::Memory.new "crystal"
pool.empty? # => true
pool.get(io)
pool.empty? # => false
