# pointer.cr:316
ptr1 = Pointer(Int32).new(1234)
ptr1.to_s # => "Pointer(Int32)@0x4d2"

ptr2 = Pointer(Int32).new(0)
ptr2.to_s # => "Pointer(Int32).null"
