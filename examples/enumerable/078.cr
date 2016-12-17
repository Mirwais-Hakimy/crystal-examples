# enumerable.cr:1401
[[:a, :b], [:c, :d]].to_h        # => {:a => :b, :c => :d}
Tuple.new({:a, 1}, {:c, 2}).to_h # => {:a => 1, :c => 2}
