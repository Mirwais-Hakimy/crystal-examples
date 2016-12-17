# deque.cr:281
a = Deque{0, 1, 2}
a.insert(1, 7) # => Deque{0, 7, 1, 2}
