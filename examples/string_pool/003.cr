# string_pool.cr:43
require "string_pool"
pool = StringPool.new
pool.empty? # => true
pool.get("crystal")
pool.empty? # => false
