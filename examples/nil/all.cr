# nil.cr: 3 examples

# nil.cr:7 (001.cr)
str = "Hello world"
str.index 'e' # => 1
str.index 'a' # => nil

# nil.cr:16 (002.cr)
str = "Hello world"
idx = str.index 'e'
# idx + 1 # Error: undefined method '+' for Nil

# nil.cr:25 (003.cr)
str = "Hello world"

# The index of 'e' in str or 0 if not found
idx1 = str.index('e') || 0

idx2 = str.index('a')
if idx2
  # Compiles: idx2 can't be nil here
  idx2 + 1
end

# Tell the compiler that we are sure the returned
# value is not nil: raises a runtime exception
# if our assumption doesn't hold.
idx3 = str.index('o').not_nil!
