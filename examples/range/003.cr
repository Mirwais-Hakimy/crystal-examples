# range.cr:48
r = Xs.new(3)..Xs.new(6)
r.to_s                 # => "xxx..xxxxxx"
r.to_a                 # => [Xs.new(3), Xs.new(4), Xs.new(5), Xs.new(6)]
r.includes?(Xs.new(5)) # => true
