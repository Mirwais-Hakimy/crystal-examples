# string_pool.cr:5
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
