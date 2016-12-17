# deque.cr:185
a = Deque{"a", "b", "b", "b", "c"}
a.delete("b") # => true
a             # => Deque{"a", "c"}
