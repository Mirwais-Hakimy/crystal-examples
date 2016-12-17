# deque.cr:208
a = Deque{1, 2, 3}
a.delete_at(1) # => 2
a              # => Deque{1, 3}
