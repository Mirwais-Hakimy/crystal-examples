# struct.cr:17
struct Mutable
  property value

  def initialize(@value : Int32)
  end
end

def change_bad(mutable)
  mutable.value = 2
end

def change_good(mutable)
  mutable.value = 2
  mutable
end

mut = Mutable.new 1
change_bad(mut)
mut.value # => 1

mut = change_good(mut)
mut.value # => 2
