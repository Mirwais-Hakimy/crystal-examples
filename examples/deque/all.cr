# deque.cr: 13 examples

# deque.cr:38 (001.cr)
deq = Deque(Int32).new(5)
deq.size # => 0

# deque.cr:58 (002.cr)
Deque.new(3, 'a') # => Deque{'a', 'a', 'a'}

# deque.cr:78 (003.cr)
Deque.new(3) { |i| (i + 1) ** 2 } # => Deque{1, 4, 9}

# deque.cr:96 (004.cr)
Deque.new([1, 2, 3]) # => Deque{1, 2, 3}

# deque.cr:106 (005.cr)
deq = Deque{2, 3}
deq.unshift 1
deq == Deque{1, 2, 3} # => true
deq == Deque{2, 3}    # => false

# deque.cr:185 (006.cr)
a = Deque{"a", "b", "b", "b", "c"}
a.delete("b") # => true
a             # => Deque{"a", "c"}

# deque.cr:208 (007.cr)
a = Deque{1, 2, 3}
a.delete_at(1) # => 2
a              # => Deque{1, 3}

# deque.cr:281 (008.cr)
a = Deque{0, 1, 2}
a.insert(1, 7) # => Deque{0, 7, 1, 2}

# deque.cr:351 (009.cr)
Deque{:foo, :bar}.size # => 2

# deque.cr:360 (010.cr)
a = Deque{1, 2, 3}
a.pop # => 3
a     # => Deque{1, 2}

# deque.cr:401 (011.cr)
a = Deque{1, 2}
a.push 3 # => Deque{1, 2, 3}

# deque.cr:441 (012.cr)
a = Deque{1, 2, 3}
a.shift # => 1
a       # => Deque{2, 3}

# deque.cr:492 (013.cr)
a = Deque{1, 2}
a.unshift 0 # => Deque{0, 1, 2}
