# tuple.cr:210
t1 = {1, "hello"}
t2 = {1.0, "hello"}
t3 = {2, "hello"}

t1 == t2 # => true
t1 == t3 # => false
