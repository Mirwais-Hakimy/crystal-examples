# deque.cr:106
deq = Deque{2, 3}
deq.unshift 1
deq == Deque{1, 2, 3} # => true
deq == Deque{2, 3}    # => false
