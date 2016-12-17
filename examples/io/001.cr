# io.cr:21
class SimpleSliceIO < IO
  def initialize(@slice : Bytes)
  end

  def read(slice : Bytes)
    slice.size.times { |i| slice[i] = @slice[i] }
    @slice += slice.size
    slice.size
  end

  def write(slice : Bytes)
    slice.size.times { |i| @slice[i] = slice[i] }
    @slice += slice.size
    nil
  end
end

slice = Slice.new(9) { |i| ('a'.ord + i).to_u8 }
String.new(slice) # => "abcdefghi"

io = SimpleSliceIO.new(slice)
io.gets(3) # => "abc"
io.print "xyz"
String.new(slice) # => "abcxyzghi"
