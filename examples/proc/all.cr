# proc.cr: 7 examples

# proc.cr:4 (001.cr)
# A proc without arguments
->{ 1 } # Proc(Int32)

# A proc with one argument
->(x : Int32) { x.to_s } # Proc(Int32, String)

# A proc with two arguments:
->(x : Int32, y : Int32) { x + y } # Proc(Int32, Int32, Int32)

# proc.cr:22 (002.cr)
Proc(Int32, String).new { |x| x.to_s } # Proc(Int32, String)

# proc.cr:31 (003.cr)
def capture(&block : Int32 -> Int32)
  # block argument is used, so block is turned into a Proc
  block
end

proc = capture { |x| x + 1 } # Proc(Int32, Int32)
proc.call(1)                 # => 2

# proc.cr:58 (004.cr)
lib LibTicker
  fun on_tick(callback : (Int32, Void* ->), data : Void*)
end

# proc.cr:67 (005.cr)
# pending by 'file:pendings/proc/005.cr'
# module Ticker
#   # The callback for the user doesn't have a Void*
#   @@box : Pointer(Void)?
# 
#   def self.on_tick(&callback : Int32 ->)
#     # Since Proc is a {Void*, Void*}, we can't turn that into a Void*, so we
#     # "box" it: we allocate memory and store the Proc there
#     boxed_data = Box.box(callback)
# 
#     # We must save this in Crystal-land so the GC doesn't collect it (*)
#     @@box = boxed_data
# 
#     # We pass a callback that doesn't form a closure, and pass the boxed_data as
#     # the callback data
#     LibTicker.on_tick(->(tick, data) {
#       # Now we turn data back into the Proc, using Box.unbox
#       data_as_callback = Box(typeof(callback)).unbox(data)
#       # And finally invoke the user's callback
#       data_as_callback.call(tick)
#     }, boxed_data)
#   end
# end
# 
# Ticker.on_tick do |tick|
#   puts tick
# end

# proc.cr:112 (006.cr)
add = ->(x : Int32, y : Int32) { x + y }
add.call(1, 2) # => 3

add_one = add.partial(1)
add_one.call(2)  # => 3
add_one.call(10) # => 11

add_one_and_two = add_one.partial(2)
add_one_and_two.call # => 3

# proc.cr:143 (007.cr)
add = ->(x : Int32, y : Int32) { x + y }
add.arity # => 2

neg = ->(x : Int32) { -x }
neg.arity # => 1
