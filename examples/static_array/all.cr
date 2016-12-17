# static_array.cr: 19 examples

# static_array.cr:9 (001.cr)
StaticArray(Int32, 3).new(42)           # => StaticArray[42, 42, 42]
StaticArray(Int32, 3).new { |i| i * 2 } # => StaticArray[0, 2, 4]
StaticArray[0, 8, 15]                   # => StaticArray[0, 8, 15]

# static_array.cr:18 (002.cr)
ints = uninitialized Int32[3]
ints[0] = 0
ints[1] = 8
ints[3] = 15

# static_array.cr:28 (003.cr)
Int32.static_array(0, 8, 15) # => StaticArray[0, 8, 15]

# static_array.cr:42 (004.cr)
ary = StaticArray[1, 'a']
ary[0]    # => 1
ary[1]    # => 'a'
ary.class # => StaticArray(Char | Int32, 2)

# static_array.cr:62 (005.cr)
StaticArray(Int32, 3).new { |i| i * 2 } # => StaticArray[0, 2, 4]

# static_array.cr:75 (006.cr)
StaticArray(Int32, 3).new(42) # => StaticArray[42, 42, 42]

# static_array.cr:91 (007.cr)
array = StaticArray(Int32, 3).new 0  # => StaticArray[0, 0, 0]
array2 = StaticArray(Int32, 3).new 0 # => StaticArray[0, 0, 0]
array3 = StaticArray(Int32, 3).new 1 # => StaticArray[1, 1, 1]
array == array2                      # => true
array == array3                      # => false

# static_array.cr:108 (008.cr)
array = StaticArray(Int32, 3).new 0 # => StaticArray[0, 0, 0]
array == nil                        # => false

# static_array.cr:126 (009.cr)
array = StaticArray(Int32, 3).new { |i| i + 1 } # => StaticArray[1, 2, 3]
array[2] = 2                                    # => 2
array                                           # => StaticArray[1, 2, 2]
# array[4] = 4                                    # raises IndexError

# static_array.cr:142 (010.cr)
array = StaticArray(Int32, 3).new { |i| i + 1 } # => StaticArray[1, 2, 3]
array.update(1) { |x| x * 2 }                   # => 4
array                                           # => StaticArray[1, 4, 3]
# array.update(5) { |x| x * 2 }                   # raises IndexError

# static_array.cr:155 (011.cr)
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.size # => 3

# static_array.cr:165 (012.cr)
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.[]= 2 # => nil
array       # => StaticArray[2, 2, 2]

# static_array.cr:179 (013.cr)
# pending by 'file:pendings/static_array/010.cr'
# a = StaticArray(Int32, 3).new { |i| i + 1 } # => StaticArray[1, 2, 3]
# a.shuffle!(Random.new(42))                  # => StaticArray[3, 2, 1]
# a                                           # => StaticArray[3, 2, 1]

# static_array.cr:192 (014.cr)
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.map! { |x| x*x } # => StaticArray[1, 4, 9]

# static_array.cr:203 (015.cr)
array = StaticArray[1, 2.5, "a"]
array.map &.to_s # => StaticArray["1", "2.5", "a"]

# static_array.cr:224 (016.cr)
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.reverse! # => StaticArray[3, 2, 1]

# static_array.cr:236 (017.cr)
array = StaticArray(Int32, 3).new(2)
slice = array.to_slice # => Slice[2, 2, 2]
slice[0] = 3
array # => StaticArray[3, 2, 2]

# static_array.cr:248 (018.cr)
ary = StaticArray(Int32, 3).new(42)
ary.to_unsafe[0] # => 42

# static_array.cr:258 (019.cr)
array = StaticArray(Int32, 3).new { |i| i + 1 }
array.to_s # => "StaticArray[1, 2, 3]"
