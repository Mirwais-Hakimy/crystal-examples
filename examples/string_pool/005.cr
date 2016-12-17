# string_pool.cr:75
require "string_pool"
pool = StringPool.new
pool.get("hey".to_unsafe, 3)
pool.size # => 1
