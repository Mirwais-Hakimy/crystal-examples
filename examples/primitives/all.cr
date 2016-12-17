# primitives.cr: 15 examples

# primitives.cr:12 (001.cr)
1.class       # => Int32
"hello".class # => String

# primitives.cr:19 (002.cr)
# pending by 'file:pendings/primitives/002.cr'
# random_value = rand # => 0.627423
# value = random_value < 0.5 ? 1 : "hello"
# value         # => "hello"
# value.class   # => String
# typeof(value) # => Int32 | String

# primitives.cr:41 (003.cr)
string = "hello"
string.object_id # => 4460249568

pointer = Pointer(String).new(string.object_id)
string2 = pointer.as(String)
string2.object_id == string.object_id # => true

# primitives.cr:83 (004.cr)
'a'.ord      # => 97
'\0'.ord     # => 0
'\u007f'.ord # => 127
'☃'.ord      # => 9731

# primitives.cr:126 (005.cr)
:foo.to_s           # => "foo"
:"hello world".to_s # => "hello world"

# primitives.cr:141 (006.cr)
# Allocate memory for an Int32: 4 bytes
ptr = Pointer(Int32).malloc(1_u64)
ptr.value # => 0

# Allocate memory for 10 Int32: 40 bytes
ptr = Pointer(Int32).malloc(10_u64)
ptr[0] # => 0
# ...
ptr[9] # => 0

# primitives.cr:159 (007.cr)
ptr = Pointer(Int32).new(5678_u64)
ptr.address # => 5678

# primitives.cr:169 (008.cr)
ptr = Pointer(Int32).malloc(4)
ptr.value = 42
ptr.value # => 42

# primitives.cr:180 (009.cr)
ptr = Pointer(Int32).malloc(4)
ptr.value = 42
ptr.value # => 42

# primitives.cr:191 (010.cr)
ptr = Pointer(Int32).new(1234)
ptr.address # => 1234

# primitives.cr:209 (011.cr)
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr = ptr.realloc(8_u8)
ptr # [1, 2, 3, 4, 0, 0, 0, 0]

# primitives.cr:221 (012.cr)
ptr = Pointer(Int32).new(1234)
ptr.address # => 1234

# An Int32 occupies four bytes
ptr2 = ptr + 1_u64
ptr2.address # => 1238

# primitives.cr:236 (013.cr)
ptr1 = Pointer(Int32).malloc(4)
ptr2 = ptr1 + 2
ptr2 - ptr1 # => 2

# primitives.cr:249 (014.cr)
add = ->(x : Int32, y : Int32) { x + y }
add.call(1, 2) # => 3

# primitives.cr:325 (015.cr)
97.unsafe_chr # => 'a'
