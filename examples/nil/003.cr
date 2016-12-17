# nil.cr:25
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
