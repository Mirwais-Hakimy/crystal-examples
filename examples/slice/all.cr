# slice.cr: 17 examples

# slice.cr:20 (001.cr)
slice = Slice[1, 'a']
slice[0]    # => 1
slice[1]    # => 'a'
slice.class # => Slice(Char | Int32)

# slice.cr:47 (002.cr)
Slice(UInt8).new(3).size # => 3

# slice.cr:58 (003.cr)
ptr = Pointer.malloc(9) { |i| ('a'.ord + i).to_u8 }

slice = Slice.new(ptr, 3)
slice.size # => 3
slice      # => Bytes[97, 98, 99]

String.new(slice) # => "abc"

# slice.cr:79 (004.cr)
slice = Slice(UInt8).new(3)
slice # => Bytes[0, 0, 0]

# slice.cr:99 (005.cr)
slice = Slice.new(3) { |i| i + 10 }
slice # => Slice[10, 11, 12]

# slice.cr:114 (006.cr)
slice = Slice.new(3, 10)
slice # => Slice[10, 10, 10]

# slice.cr:132 (007.cr)
slice = Slice(UInt8).empty
slice.size # => 0

# slice.cr:142 (008.cr)
slice = Slice.new(5) { |i| i + 10 }
slice # => Slice[10, 11, 12, 13, 14]

slice2 = slice + 2
slice2 # => Slice[12, 13, 14]

# slice.cr:162 (009.cr)
slice = Slice.new(5) { |i| i + 10 }
slice[0] = 20
slice[-1] = 30
slice # => Slice[20, 11, 12, 13, 30]

# slice[10] = 1 # raises IndexError

# slice.cr:187 (010.cr)
slice = Slice.new(5) { |i| i + 10 }
slice # => Slice[10, 11, 12, 13, 14]

slice2 = slice[1, 3]
slice2 # => Slice[11, 12, 13]

# slice.cr:246 (011.cr)
slice = Slice[1, 2, 3]
slice.map! { |x| x * x }
slice # => Slice[1, 4, 9]

# slice.cr:260 (012.cr)
# pending by 'file:pendings/slice/012.cr'
# slice = Slice[1, 2.5, "a"]
# slice.map &.to_s # => Slice["1", "2.5", "a"]

# slice.cr:296 (013.cr)
src = Slice['a', 'a', 'a']
dst = Slice['b', 'b', 'b', 'b', 'b']
src.copy_to dst
dst             # => Slice['a', 'a', 'a', 'b', 'b']
# dst.copy_to src # raises IndexError

# slice.cr:333 (014.cr)
src = Slice['a', 'a', 'a']
dst = Slice['b', 'b', 'b', 'b', 'b']
src.move_to dst
dst             # => Slice['a', 'a', 'a', 'b', 'b']
# dst.move_to src # raises IndexError

# slice.cr:364 (015.cr)
slice = UInt8.slice(97, 62, 63, 8, 255)
slice.hexstring # => "613e3f08ff"

# slice.cr:396 (016.cr)
slice = UInt8.slice(97, 62, 63, 8, 255)
slice.hexdump # => "00000000  61 3e 3f 08 ff                                    a>?.."

# slice.cr:506 (017.cr)
slice = Slice.new(3, 10)
slice.to_unsafe[0] # => 10
