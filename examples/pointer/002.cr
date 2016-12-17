# pointer.cr:59
a = 1
pointerof(a).null? # => false

b = Pointer(Int32).new(0)
b.null? # => true
