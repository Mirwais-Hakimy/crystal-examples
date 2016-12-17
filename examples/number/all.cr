# number.cr: 13 examples

# number.cr:19 (001.cr)
floats = Float64[1, 2, 3, 4]
floats.class # => Array(Float64)

ints = Int64[1, 2, 3]
ints.class # => Array(Int64)

# number.cr:40 (002.cr)
floats = Float64.slice(1, 2, 3, 4)
floats.class # => Slice(Float64)

ints = Int64.slice(1, 2, 3)
ints.class # => Slice(Int64)

# number.cr:58 (003.cr)
floats = Float64.static_array(1, 2, 3, 4)
floats.class # => StaticArray(Float64, 4)

ints = Int64.static_array(1, 2, 3)
ints.class # => StaticArray(Int64, 3)

# number.cr:76 (004.cr)
3.step(to: 10, by: 2) do |n|
  puts n
end

# number.cr:121 (005.cr)
123.abs  # => 123
-123.abs # => 123

# number.cr:131 (006.cr)
4.abs2   # => 16
1.5.abs2 # => 2.25

# number.cr:144 (007.cr)
123.sign # => 1
0.sign   # => 0
-42.sign # => -1

# number.cr:156 (008.cr)
11.divmod(3)  # => {3, 2}
11.divmod(-3) # => {-4, -1}

# number.cr:173 (009.cr)
# pending by 'file:pendings/number/009.cr'
# 1234.567.significant(1) # => 1000
# 1234.567.significant(2) # => 1200
# 1234.567.significant(3) # => 1230
# 1234.567.significant(4) # => 1235
# 1234.567.significant(5) # => 1234.6
# 1234.567.significant(6) # => 1234.57
# 1234.567.significant(7) # => 1234.567
# 1234.567.significant(8) # => 1234.567
# 
# 15.159.significant(1, base = 2) # => 16

# number.cr:209 (010.cr)
-1763.116.round(2) # => -1763.12

# number.cr:225 (011.cr)
5.clamp(10..100)   # => 10
50.clamp(10..100)  # => 50
500.clamp(10..100) # => 100

# number.cr:237 (012.cr)
5.clamp(10, 100)   # => 10
50.clamp(10, 100)  # => 50
500.clamp(10, 100) # => 100

# number.cr:250 (013.cr)
0.zero? # => true
5.zero? # => false
