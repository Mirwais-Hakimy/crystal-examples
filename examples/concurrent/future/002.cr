# concurrent/future.cr:133
f = future { `echo hello` }
# ... other actions ...
f.get # => "hello\n"
