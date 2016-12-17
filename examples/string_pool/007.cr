# string_pool.cr:142
require "string_pool"
pool = StringPool.new
string = "crystal"
pool.empty? # => true
pool.get(string)
pool.empty? # => false
