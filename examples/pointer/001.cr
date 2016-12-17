# pointer.cr:17
x = 1
ptr = pointerof(x)
ptr.value = 2
x # => 2
