# deque.cr:441
a = Deque{1, 2, 3}
a.shift # => 1
a       # => Deque{2, 3}
