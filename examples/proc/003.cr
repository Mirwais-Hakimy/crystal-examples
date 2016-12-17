# proc.cr:31
def capture(&block : Int32 -> Int32)
  # block argument is used, so block is turned into a Proc
  block
end

proc = capture { |x| x + 1 } # Proc(Int32, Int32)
proc.call(1)                 # => 2
