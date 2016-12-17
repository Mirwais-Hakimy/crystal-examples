require "spec"
require "string_pool"
it "string_pool.cr" do
puts # :nocode:

puts "# string_pool.cr:5 (001.cr)" # :nocode: :example:
# require "string_pool"

pool = StringPool.new
a = "foo" + "bar"
b = "foo" + "bar"
a.object_id # => 136294360
b.object_id # => 136294336
a = pool.get(a)
b = pool.get(b)
a.object_id # => 136294312
b.object_id # => 136294312

puts "# string_pool.cr:27 (002.cr)" # :nocode: :example:
pool = StringPool.new
( pool.size ).should eq( 0 )

puts "# string_pool.cr:43 (003.cr)" # :nocode: :example:
pool = StringPool.new
( pool.empty? ).should eq( true )
pool.get("crystal")
( pool.empty? ).should eq( false )

puts "# string_pool.cr:58 (004.cr)" # :nocode: :example:
pool = StringPool.new
ptr = Pointer.malloc(9) { |i| ('a'.ord + i).to_u8 }
slice = Slice.new(ptr, 3)
( pool.empty? ).should eq( true )
pool.get(slice)
( pool.empty? ).should eq( false )

puts "# string_pool.cr:75 (005.cr)" # :nocode: :example:
pool = StringPool.new
pool.get("hey".to_unsafe, 3)
( pool.size ).should eq( 1 )

puts "# string_pool.cr:126 (006.cr)" # :nocode: :example:
pool = StringPool.new
io = IO::Memory.new "crystal"
( pool.empty? ).should eq( true )
pool.get(io)
( pool.empty? ).should eq( false )

puts "# string_pool.cr:142 (007.cr)" # :nocode: :example:
pool = StringPool.new
string = "crystal"
( pool.empty? ).should eq( true )
pool.get(string)
( pool.empty? ).should eq( false )


end
