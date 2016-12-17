# deque.cr:360
a = Deque{1, 2, 3}
a.pop # => 3
a     # => Deque{1, 2}
