# primitives.cr:41
string = "hello"
string.object_id # => 4460249568

pointer = Pointer(String).new(string.object_id)
string2 = pointer.as(String)
string2.object_id == string.object_id # => true
